class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def today
    @posts = Post.where("DATE(date) = ?", Date.today)
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    @post.date = Time.now

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.permit(:name, :abn, :amount)
    end
end