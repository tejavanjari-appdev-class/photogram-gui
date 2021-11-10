class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})
    render({:template => "/user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("username")
    @user = User.where(:username => url_username).first

    render({:template => "/user_templates/show.html.erb"})
  end

  def insert
    username = params.fetch("input_username")
    
    new_user = User.new
    new_user.username = username
    new_user.save
    redirect_to("/users")
  end

  def update
    user_id = params.fetch("user_id")
    new_username = params.fetch("input_username")

    user = User.where({:id => user_id}).first
    user.username = new_username

    user.save

    redirect_to("/users/"+new_username)

  end
end