# frozen_string_literal: true

module PkoApi
  module User
    class GetAccounts < ::PkoApi::Base
      class << self
        def call(user_id, bank_ids)
          new(user_id, bank_ids).call
        end
      end

      def call
        bank_ids.flat_map(&method(:accounts))
      end

      private

      attr_reader :user_id, :bank_ids

      def initialize(user_id, bank_ids)
        @user_id = user_id
        @bank_ids = bank_ids
      end

      def accounts(bank_id)
        GetAccount.call(user_id, bank_id)
      end
    end
  end
end
