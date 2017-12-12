class Mutations::UpdateAuthor < GraphQL::Function

  argument :id, types.ID

  type Types::AuthorType

  def call(obj, args, ctx)
    author = Author.find(args[:id])
    author.try :update, args.to_h
    author
  end

end
