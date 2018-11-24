# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApplicationController
      def show
        render json: GroupRepresenter.one(group)
      end

      private

      def group
        @group ||= Group.find(params[:id])
      end
    end
  end
end
