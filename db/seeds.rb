group = Group.create name: "Family"

user = User.create name: "Zuzia"

UserGroup.create user: user, group: group
