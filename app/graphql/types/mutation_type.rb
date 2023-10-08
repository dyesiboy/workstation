module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :create_company, mutation: Mutations::Companies::CreateCompany

    field :login, Types::UserType, null: false do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      user = User.find_by(email: email)
      if user.authenticate(password)
        user.token = user.to_sgid(expires_in: 12.hours, for: 'GraphQL')
        user
      else
        raise GraphQL::ExecutionError.new('Invalid email or password')
      end
    end
  end
end
