# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      def index
        render json: PkoApi::User::GetAccounts.call(token)
      end

      private

      def token
        params[:token]
      end
    end
  end
end
