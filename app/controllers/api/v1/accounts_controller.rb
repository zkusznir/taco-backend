# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      def index
        render json: PkoApi::User::GetAccounts.call(id)
      end

      private

      def id
        params[:id]
      end
    end
  end
end
