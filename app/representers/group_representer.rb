# frozen_string_literal: true

class GroupRepresenter
  class << self
    def one(group)
      {
        id: group.id,
        name: group.name,
        users: group.users,
      }
    end

    def all_for(user)
      user.groups.map do |group|
        {
          id: group.id,
          name: group.name,
          users_count: group.users.count,
        }
      end
    end
  end
end
