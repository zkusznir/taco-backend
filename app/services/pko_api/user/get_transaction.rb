# frozen_string_literal: true

module PkoApi
  module User
    class GetTransaction < ::PkoApi::Base
      class << self
        def call(user, account, bank_id)
          new(user, account, bank_id).call
        end
      end

      def call
        response
          .deep_symbolize_keys
          .fetch(:accounts, [])
          .map(&method(:account_details))
      end

      private

      attr_reader :token, :account, :bank_id

      def initialize(user, account, bank_id)
        @token = user.token
        @account = account
        @bank_id = bank_id
      end

      def transaction_details(transaction)
        {
          id: transaction[:itemId],
          amount: transaction[:amount],
          currency: transaction[:currency],
          description: transaction[:description],
          category: transaction[:transactionCategory],
        }
      end

      def response
        JSON.parse(raw_response.body)
      end

      def raw_response
        connection.post do |req|
          req.url "/#{bank_id}/v2_1.1/accounts/v2_1.1/getTransactionsDone"
          req.body = request_body.to_json
        end
      end

      def connection
        ::Faraday.new(url: ::PkoApi::Base::API_URL) do |req|
          req.adapter Faraday.default_adapter

          req.headers["Authorization"] = "Bearer #{token}"
          req.headers["Accept-Encoding"] = "gzip"
          req.headers["Accept-Language"] = "en-US"
          req.headers["Accept-Charset"] = "utf-8"
          req.headers["Content-Type"] = "application/json"
          req.headers["X-JWS-SIGNATURE"] = "some-signature"
        end
      end

      def request_body
        {
          accountNumber: account,
          requestHeader: {
            requestId: SecureRandom.uuid,
            sendDate: Time.zone.now,
            token: token,
            tppId: ::PkoApi::Base::CLIENT_ID,
          }
        }
      end
    end
  end
end
