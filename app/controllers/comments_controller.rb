class CommentsController < ApplicationController
  before_filter :get_parent

  
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
    redirect_to root_path
  end
  
  protected
  
  def get_parent
    @parent = Micropost.find_by_id(params[:micropost_id]) if params[:micropost_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    

  end
end
