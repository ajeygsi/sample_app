class CommentsController < ApplicationController
  before_filter :get_parent
  uses_tiny_mce :options => {
                            :theme => 'advanced',
                            :theme_advanced_resizing => true,
                            :theme_advanced_resize_horizontal => false,
                            :plugins => %w{ table fullscreen }
                          }


  
  def new
    @comment = @parent.comments.build
  end
  
  def create
    @params = params[:comment]
    @body = @params[:body]
    @title = @params[:title]
    @commentable_id = @params[:commentable_id]
    @commentable_type = @params[:commentable_type]

    if(@commentable_type == "Micropost") then
      @parent = Micropost.find_by_id(@commentable_id)
    else
      @parent = Comment.find_by_id(@commentable_id)
    end

    @comment = @parent.comments.build(params[:comment])
    @comment.save
    
    # trying to redirect to posts page.
    @micropost = get_micropost(@comment)

    redirect_to @micropost
  end
  
  protected

  def get_micropost(c)
    if(c.commentable_type == "Micropost")
      micropost = Micropost.find_by_id(c.commentable_id)
      micropost
    else
      parent_comment = Comment.find_by_id(c.commentable_id)
      get_micropost(parent_comment)
    end
  end

  
  def get_parent
    @parent = Micropost.find_by_id(params[:micropost_id]) if params[:micropost_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    

  end
end
