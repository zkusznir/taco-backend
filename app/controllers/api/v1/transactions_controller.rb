# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < ApplicationController
      ALL_BANKS_IDS = [1, 2, 3, 4].freeze

      def index
        render json: PkoApi::Group::GetTransactions.for(group, ALL_BANKS_IDS)
      end

      private

      def group
        @group ||= Group.find(params[:id])
      end
    end
  end
end
