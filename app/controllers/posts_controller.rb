class PostsController < ApplicationController
  def index
    @datatable = PostsDatatable.new view_context
  end

  def search
    render json: PostsDatatable.new(view_context)
  end

  def with_comments_count
    @datatable = PostsWithCommentsCountDatatable.new view_context
  end

  def with_comments_count_search
    render json: PostsWithCommentsCountDatatable.new(view_context)
  end

  def with_comments_body
    @datatable = PostsWithCommentsBodyDatatable.new view_context
  end

  def with_comments_body_search
    render json: PostsWithCommentsBodyDatatable.new(view_context)
  end
end
