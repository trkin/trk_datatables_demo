class PostsDatatable < TrkDatatables::ActiveRecord
  def columns
    {
      'posts.id': {},
      'posts.user_id': {},
      'posts.title': {},
      'posts.body': {},
      'posts.status': {select_options: Post.statuses},
      'posts.verified': {},
      'posts.published_on': {},
    }
  end

  def all_items
    # you can use @view.params
    Post.all
  end

  def rows(filtered)
    # you can use @view.link_to and other helpers
    filtered.map do |post|
      [
        @view.link_to(post.id, post),
        post.user_id,
        post.title,
        post.body,
        post.status,
        post.verified,
        post.published_on,
      ]
    end
  end
end
