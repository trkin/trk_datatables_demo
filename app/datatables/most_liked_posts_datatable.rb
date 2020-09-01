class MostLikedPostsDatatable < TrkDatatables::ActiveRecord
  def columns
    {
      'posts.id': {},
      'posts.title': {},
      'integer_calculated_in_db.count_likes': {}
    }
  end

  # using left_outer_joins and group works fine with ordering but I can not
  # search (globally or locally)
  def all_items
    Post.select(%(
                posts.*,
                COUNT(comments.id) AS count_likes
                ))
        .left_outer_joins(:comments)
        .group('posts.id')
  end

  def all_items_count
    all_items.returns_count_sum.count
  end

  def filtered_items_count
    filtered_items.returns_count_sum.count
  end

  # using count will raise an error. Not sure why Count(Count(*)) is an error
  # def all_items
  #   Post.all
  #       .select(%(
  #               posts.*,
  #               (SELECT COUNT(*) FROM comments
  #               WHERE comments.post_id = posts.id) AS count_likes
  #               ))
  # end

  # def filtered_items_count
  #   filtered_items.count
  # end

  def rows(filtered)
    # you can use @view.link_to and other helpers
    filtered.map do |post|
      [
        @view.link_to(post.id, post),
        post.title,
        post.count_likes,
      ]
    end
  end

  def default_order
    [[2, :desc]]
  end
end
