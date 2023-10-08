module Mutations
  module Companies
    class UpdateCompany < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: true
      argument :address, String, required: true

      type Types::CompanyType

      def resolve(**attributes)
        Company.create!(attributes)
      end
    end
  end
end
