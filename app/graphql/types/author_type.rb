Type::AuthorInputType = GraphQL::InputObjectType.define do
  name = "Author Input Type"
  description = "Properties for creating and updating an Author"


  argument :first_name, types.String
  argument :last_name, types.String
  argument :birth_year, types.Int
  argument :is_alive, types.Boolean

end


Types::AuthorType = GraphQL::ObjectType.define do
  name "AuthorType"

  field :first_name, !types.String
  field :last_name, types.String
  field :birth_year, types.Int
  field :is_alive, types.Boolean
  field :id, types.ID

  field :full_name, types.String do
    description "The full name of the author"
    resolve ->(o, _, _) { [o.first_name, o.last_name].compact.join(' ') }
  end

  field :coordinates, Types::PairType do
    description "The coordinates of the author"
  end

  field :publication_years, types[types.Int]

  
end