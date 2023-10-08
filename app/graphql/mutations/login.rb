module Mutations
  class Login < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
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
