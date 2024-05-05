class UserDrop < Liquid::Drop
  include Rails.application.routes.url_helpers

  def initialize(user)
    @user = user
  end

  def full_name
    @user.full_name
  end

  def age
    @user.age
  end

  def gender
    @user.gender
  end

  def created_at
    @user.created_at
  end

  def link_to_delete_user
    url_for(action: 'destroy', controller: 'users', id: @user.id, only_path: true)
  end
end
