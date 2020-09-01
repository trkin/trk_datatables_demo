class PostsController < ApplicationController
  def index
    @datatable = PostsDatatable.new view_context
  end

  def search
    render json: PostsDatatable.new(view_context)
  end

  def most_liked
    @datatable = MostLikedPostsDatatable.new view_context
  end

  def most_liked_search
    render json: MostLikedPostsDatatable.new(view_context)
  end
end
