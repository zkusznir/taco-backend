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
  end
end
