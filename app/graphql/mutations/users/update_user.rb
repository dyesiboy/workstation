module Mutations
  module Users
    class UpdateUser < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :company_id, Integer, required: true
      argument :first_name, String, required: true
      argument :middle_name, String, required: false
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::UserType

      def resolve(id:, **attributes)
        user = User.find(id)
        if user.update(attributes)
          user
        else
          raise GraphQL::ExecutionError.new(user.errors.full_messages)
        end
      end
    end
  end
end
