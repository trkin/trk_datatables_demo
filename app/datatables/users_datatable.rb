class UsersDatatable < TrkDatatables::ActiveRecord
  def columns
    {
      'users.id': {},
      'users.email': {},
      'users.name': {},
      'users.registered_at': {},
    }
  end

  def all_items
    # you can use @view.params
    User.all
  end

  def rows(filtered)
    # you can use @view.link_to and other helpers
    filtered.map do |user|
      [
        @view.link_to(user.id, user),
        user.email,
        user.name,
        user.registered_at.to_s(:long),
      ]
    end
  end
end
