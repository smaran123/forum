class PostsController < ApplicationController
  
before_action :set_post, :only=>[:show,:edit,:update,:destroy]
	
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at ASC")
		
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
      # if   @post.valid_with_captcha? 
         
       if  @post.valid_with_captcha? && @post.save
         #save_with_captcha
           
 			redirect_to @post
		else
			render "new"
		end
 
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render "edit"
		end
	end

	def show
	end 

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def set_post
		@post=Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit!
	end

end
