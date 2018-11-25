# frozen_string_literal: true

module PkoApi
  module Group
    class GetTransactions < ::PkoApi::Base
      class << self
        def call(group, bank_ids)
          new(group, bank_ids).call
        end
      end

      def call
        users
          .flat_map { |user| ::PkoApi::User::GetAccounts.call(user.id, bank_ids) }
          .flat_map do |account|
            ::PkoApi::User::GetTransaction.call(
              ::User.find(account[:user_id]),
              account[:account_number],
              bank_id: account[:bank_id],
            )
          end
      end

      private

      attr_reader :users, :bank_ids

      def initialize(group, bank_ids)
        @users = group.users
        @bank_ids = bank_ids
      end

      def response
        JSON.parse(raw_response.body)
      end

      def raw_response
        connection.post do |req|
          req.url "/#{bank_id}/v2_1.1/accounts/v2_1.1/getAccounts"
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
