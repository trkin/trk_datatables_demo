class PostsWithCommentsBodyDatatable < TrkDatatables::ActiveRecord
  def columns
    {
      'posts.id': {},
      'integer_calculated_in_db.comments_count': {},
      'comments.body': {},
    }
  end

  # Using left_outer_joins and group works fine with ordering but I can not
  # search (globally or locally) arel_table
  def all_items
    # can not filter for aggregate function, so use subquery instead of
    # COUNT(comments.id) AS comments_count,
    # postgres STRING_AGG is GROUP_CONCAT in mysql
    Post.select(%(
                posts.*,
                (#{comments_count}) AS comments_count,
                GROUP_CONCAT(comments.body) AS comments_body
                ))
        .left_outer_joins(:comments)
        .group('posts.id')
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
        post.comments_count,
        post.comments_body,
      ]
    end
  end
end
