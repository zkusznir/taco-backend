# frozen_string_literal: true

class UserRepresenter
  class << self
    def one(user)
      {
        id: user.id,
        name: user.name,
        groups: user.groups,
      }
    end
  end
end
