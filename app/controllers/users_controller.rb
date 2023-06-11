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

    new_follow = UserFollow.find_or_create_by(username: params[:username], follower: params[:follower])
    
    render json: { message: "User registered", user: new_follow}, status: :created
  end
end
