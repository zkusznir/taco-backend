# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApplicationController
      def show
        render json: GroupRepresenter.one(group)
      end

      def index
        render json: GroupRepresenter.all_for(user)
      end

      def create
        group = Group.create(group_params)
        group_users_params.each { |user_id| UserGroup.create(group: group, user_id: user_id) }

        render json: GroupRepresenter.one(group.reload)
      end

      private

      def group
        @group ||= Group.find(params[:id])
      end

      def user
        @user ||= User.find(params[:id])
      end

      def group_params
        params.require(:group).permit(:name)
      end

      def group_users_params
        params.require(:user_ids)
      end
    end
  end
end
