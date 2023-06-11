class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def create
    if !params.has_key?(:username) or !params.has_key?(:fullname)
      render json: { error: "Parameter username and fullname is needed" }, status: :unprocessable_entity
      return
    end
    
    new_user = User.find_or_create_by(username: params[:username])
    new_user.update({
      fullname: params[:fullname]
    })
    
    render json: { message: "User registered", user: new_user}, status: :created
  end
  
  def index
    users = User.all
    
    render json: {
      message: "success",
      users: users
    }
  end
  
  def follow
    if !params.has_key?(:username) or !params.has_key?(:follower)
      render json: { error: "Parameter username and follower is needed" }, status: :unprocessable_entity
      return
    end

    follower = User.find_by(username: params[:follower])
    new_follow = UserFollow.find_or_create_by(username: params[:username], follower: followerh)
    
    render json: { message: params[:username] + " followed", user_follow: new_follow}, status: :created
  end

  def list_followed
    if !params.has_key?(:username)
      render json: { error: "Parameter username is needed" }, status: :unprocessable_entity
      return
    end

    followed_list = Activity
      .connection
      .select_all("
        select a.username,
          a.start_sleep,
          a.end_sleep,
          (julianday(a.end_sleep) -julianday( a.start_sleep)) * 24 as duration
        from activities a
          join user_follows uf on uf.username = a.username
        where uf.follower = '"+ params[:username] +"'
        order by duration desc"
      )

      render json: {message: 'success', list: followed_list}
  end
end
