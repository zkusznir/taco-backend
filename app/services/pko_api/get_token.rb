# frozen_string_literal: true

module PkoApi
  class GetToken
    class << self
      # TODO: Call real API - impossible for now as server is down
      def call
        {
          "responseHeader": {
            "requestId": "0a3afcb8-e59f-11e8-9f32-f2801f1b9fd1",
            "sendDate": "2018-11-20T09:36:20.512+01:00",
            "isCallback": false,
          },
          "access_token": "some-token",
          "token_type": "bearer",
          "expires_in": "604800",
          "refresh_token": "refresh-token",
          "scope": "ais",
          "scope_details": {
            "privilegeList": [
              {
                "accountNumber": "PL88102024980000000000000763",
                "ais-accounts:getAccounts": {
                  "scopeUsageLimit": "multiple"
                },
                "ais:getAccount": {
                  "scopeUsageLimit": "multiple"
                },
                "ais:getTransactionsDone": {
                  "scopeUsageLimit": "multiple",
                  "maxAllowedHistoryLong": 1460,
                  "notBefore": "1918-11-20T09:36:20.512+01:00",
                  "notAfter": "2118-11-20T09:36:20.512+01:00",
                },
              },
            ],
            "scopeGroupType": "ais",
            "consentId": "consent_id",
            "scopeTimeDuration": 3,
            "scopeTimeLimit": "2018-11-11T10:20:48.063Z",
            "throttlingPolicy": "psd2Regulatory",
          }
        }
      end
    end
  end
end
