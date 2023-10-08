module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end


    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :companies, [CompanyType], null: false,
      description: "Get allcompanies"
    def companies
      Company.all
    end

    field :me, Types::UserType, null: false,
      description: "An example field added by generator"

    def me
      authenticate!
      current_user
    end


    field :user, Types::UserType, null: false do
      description 'Find user by id'
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end


    field :company, Types::CompanyType, null: false do
      description 'Find user by id'
      argument :id, ID, required: true
    end

    def company(id:)
      Company.find(id)
    end
  end
end
