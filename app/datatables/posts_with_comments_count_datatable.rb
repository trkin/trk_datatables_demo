class PostsWithCommentsCountDatatable < TrkDatatables::ActiveRecord
  def columns
    {
      'posts.id': {},
      'string_calculated_in_db.title_and_body': {},
      'integer_calculated_in_db.comments_count': {},
    }
  end

  def all_items
    Post.select(%(
                posts.*,
                #{title_and_body} AS title_and_body,
                (#{comments_count}) AS comments_count
                ))
  end

  def title_and_body
    "concat(posts.title, ' ', posts.body)"
  end

  def comments_count
    <<~SQL
      (SELECT COUNT(*) FROM comments
      WHERE comments.post_id = posts.id)
    SQL
  end

  def all_items_count
    all_items.returns_count_sum.count
  end

  def filtered_items_count
    filtered_items.returns_count_sum.count
  end

  def rows(filtered)
    # you can use @view.link_to and other helpers
    filtered.map do |post|
      [
        @view.link_to(post.id, post),
        post.title_and_body,
        post.comments_count,
      ]
    end
  end

  def default_order
    [[2, :desc]]
  end
end
