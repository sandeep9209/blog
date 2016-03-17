require 'active_support/core_ext'

class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	def index 
      @posts = current_user.posts
	end

	def new
        @post = current_user.posts.build
    end

    def create
       @post = current_user.posts.build(post_params)
         @post.user_id = current_user.id
        respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    end
    def show
    @post = Post.find(params[:id])
    end


    def edit
       @post = Post.find(params[:id])
    end 

    def update
        @post = Post.find(params[:id])

        if @post.update(params[:post].permit(:appoinment, :about, :time))
           redirect_to @post
         else
           render 'edit'    
         end 
     end

     def destroy

            @post = Post.find(params[:id])
            @post.destroy
            redirect_to posts_path
     end 
	private 


    def set_post
      @post = Post.find(params[:id])
    end
	  def post_params
	  	params.require(:post).permit(:appointment, :about, :time, :user_id)
	  end


end
