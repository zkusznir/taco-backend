# frozen_string_literal: true

module PkoApi
  module User
    class GetAccounts
      class << self
        def call(token)
          new.call(token)
        end
      end

      def call(_token)
        response
          .fetch(:accounts, [])
          .map(&method(:account_details))
      end

      private

      attr_reader :token

      def initialize
        @token = token
      end

      def account_details(account)
        {
          number: account[:accountNumber],
          type: account[:accountTypeName],
          description: account.dig(:accountType, :description),
        }
      end

      # TODO: Fetch from real API once it's alive
      def response
        {
          "responseHeader": {
            "requestId": "3ec65c44-e80f-11e8-9f32-f2801f1b9fd1",
            "sendDate": "2018-11-20T11:24:25.954Z",
            "isCallback": false,
          },
          "accounts": [
            {
              "accountNumber": "PL88102024980000000000000667",
              "accountTypeName": "ROR",
              "accountType": {
                "code": "ROR",
                "description": "Rachunek oszczednosciowo-rozliczeniowy" }
              },
              {
                "accountNumber": "PL88102024932323000000000337",
                "accountTypeName": "LOK",
                "accountType": {
                  "code": "LOK",
                  "description": "Lokata jak marzenie" }
                },
            ],
            "pageInfo": {},
          }
      end
    end
  end
end
