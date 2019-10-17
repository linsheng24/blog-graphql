module Mutations
  class RemovePost < BaseMutation
    argument :id, Integer, required: true  
    
    type String
    
    def resolve(id: nil)
      if(Post.find(id).destroy)
        return "刪除成功"
      end   
    end
  end
end