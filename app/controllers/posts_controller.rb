class PostsController < ApplicationController

	before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

	def new
		@group = Group.find(params[:group_id])
		@post = Post.new
	end

	def create
		@group = Group.find(params[:group_id])
		@post = Post.new(post_params)
		@post.group = @group
		@post.user = current_user
		if @post.save
			redirect_to group_path(@group), notice: "Post created."
		else
			render :new
		end
	end

	def edit
		@group = Group.find(params[:group_id])
		@post = Post.find(params[:id])
		@post.group = @group
		@post.user = current_user
	end

	def update
		@group = Group.find(params[:group_id])
		@post = Post.find(params[:id])
		@post.group = @group
		@post.user = current_user
		if @post.update(post_params)
			redirect_to account_posts_path, notice: "Update succeed."
		else
			render :edit
		end
	end

	def show
		@group = Group.find(params[:group_id])
		@post = Post.find(params[:id])
		@post.group = @group
		@post.user = current_user
	end

	def destroy
		@group = Group.find(params[:group_id])
		@post = Post.find(params[:id])
		@post.group = @group
		@post.user = current_user
		@post.destroy
		redirect_to account_posts_path, notice: "Post deleted."		
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end


end
