module Types
  class QueryType < BaseObject

    field :all_posts, [PostType], null: false
    field :find_post, PostType, null: false do
      description 'Find an post by ID'
      argument :id, ID, required: true
    end
    field :find_posts_by_type, [PostType], null: false do
      description 'Find an post by type'
      argument :id, ID, required: true
    end

    def all_posts
      posts = Post.all
      result = posts.map {|c| {id: c.id, title: c.title, content: c.content, type: c.type.name}}
      return result
    end

    def find_post(id: id)
      post = Post.find(id)
      return {id: post.id, title: post.title, postontent: post.content, type: post.type.name}
    end

    def find_posts_by_type(id: id)
      posts = Post.where("type_id = ?", id)
      result = posts.map {|c| {id: c.id, title: c.title, content: c.content, type: c.type.name}}
      return result
    end
  end
end