class CommentsController < ApplicationController

def create
	@post = Post.find(params[:post_id])
	@comment= @post.comments.create(comment_params)
	@comment.user_id = current_user.id if current_user
	@comment.save
	if @comment.save
		redirect_to @post
	else
		render :new
	end
end

def edit
	@post = Post.find(params[:post_id])
	@comment= @post.comments.find(params[:id])
end

def update
	@post = Post.find(params[:post_id])
	@comment= @post.comments.find(params[:id])
	if @comment.update(comment_params)
		redirect_to @post
	else
		render :edit
	end
end

def destroy
	@post = Post.find(params[:post_id])
	@comment= @post.comments.find(params[:id])
	@comment.destroy
	redirect_to @post
end

private
	
def comment_params
	params.require(:comment).permit!
end

end





