# frozen_string_literal: true

class UserRepresenter
  class << self
    def one(user)
      {
        id: user.id,
        name: user.name,
        token: user.token,
        groups: user.groups,
      }
    end

    def all
      User.all.only :id, :name
    end

    def all_for(group)
      group.users.map do |user|
        {
          id: user.id,
          name: user.name,
        }
      end
    end
  end
end
