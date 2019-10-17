class Post < ApplicationRecord
    belongs_to :type

    default_scope { where(deleted_at: nil) }

    def destroy
      update(deleted_at: Time.now)
    end   
     
end
