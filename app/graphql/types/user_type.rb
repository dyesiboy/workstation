# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :company_id, Integer, null: false
    field :id, ID, null: false
    field :first_name, String, null: false
    field :middle_name, String, null: false
    field :last_name, String, null: false
    field :token, String, null: false
    field :email, String, null: false
    field :password, String, null: false
  end
end
