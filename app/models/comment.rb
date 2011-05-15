class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable

  # exerpt from app/models/comment.rb
  def post
    return @post if defined?(@post)
    @post = commentable.is_a?(Micropost) ? commentable : commentable.post
  end
  
end
