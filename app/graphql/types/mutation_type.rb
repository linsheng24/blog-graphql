module Types
  class MutationType < BaseObject
    field :create_post, mutation: Mutations::CreatePost
    field :remove_post, mutation: Mutations::RemovePost
  end
end