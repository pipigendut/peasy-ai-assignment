class UsersController < ApplicationController
  def index
    @users = if params[:search].present?
      User.where("COALESCE(name->>'first', '') || ' ' || COALESCE(name->>'last', '') ILIKE ?", "%#{params[:search]}%")
    else
      User.all
    end
    @users = @users.order(created_at: :desc).page(params[:page]).per(10)
    users_drop = @users.map { |user| UserDrop.new(user) }
    users_table_liquid_file = File.read(Rails.root.join('app', 'templates', 'users', 'table.liquid'))
    start_number = (@users.current_page - 1) * @users.limit_value
    @users_table_liquid_template = Liquid::Template.parse(users_table_liquid_file).render(
      'users' => users_drop,
      'form_authenticity_token' => form_authenticity_token,
      'start_number' => start_number
    )
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end
end
