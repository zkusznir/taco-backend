# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def show
        render json: UserRepresenter.one(user)
      end

      def index
        render json: UserRepresenter.all
      end

      private

      def user
        @user ||= User.find(params[:id])
      end
    end
  end
end
