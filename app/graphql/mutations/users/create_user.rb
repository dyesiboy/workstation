module Mutations
  module Users
    class CreateUser < Mutations::BaseMutation
      argument :company_id, Integer, required: true
      argument :first_name, String, required: true
      argument :middle_name, String, required: false
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::UserType

      def resolve(**attributes)
        user = User.new(attributes)
        if user.save
          user
        else
          raise GraphQL::ExecutionError.new(user.errors.full_messages)
        end
      end
    end
  end
end
