module Types
  class MutationType < Types::BaseObject
    field :login, Types::UserType, null: false, mutation: Mutations::Login
    field :create_user, mutation: Mutations::Users::CreateUser
    field :create_company, mutation: Mutations::Companies::CreateCompany
  end
end
