module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :type, Integer, required: true
    type Types::PostType
  
    def resolve(title: nil, content: nil, type: nil)
      new_post = Post.create!(
        title: title,
        content: content,
        type: Type.find(type),
      )
      return {
        id: new_post.id,
        title: title,
        content: content,
        type: Type.find(type).name,
      }      
    end
  end
end