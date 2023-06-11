class ActivitiesController < ApplicationController
  skip_before_action :verify_authenticity_token  
  
  def sleep
    if !params.has_key?(:username) 
      render json: { error: "Parameter username is needed" }, status: :unprocessable_entity
      return
    end
    
    previous_sleep = Activity.where(
      username: params[:username],
      end_sleep: nil
    )

    if previous_sleep.count > 0
      render json: { message: params[:username] + " has not wake up yet"}, status: :unprocessable_entity
      return
    end
    
    new_sleep = Activity.create(
      username: params[:username],
      start_sleep: Time.now
    )

    render json: { message: params[:username] + " sleep"}, status: :created
  end
  
  def wake
    current_time = Time.now
    random_hours = rand(1..10) # Generates a random number between 1 and 10
    new_time = current_time + random_hours * 3600 # Adds the random hours to current_time

    if !params.has_key?(:username) 
      render json: { error: "Parameter username is needed" }, status: :unprocessable_entity
      return
    end

    previous_sleep = Activity.where(
      username: params[:username],
      end_sleep: nil
    )

    if previous_sleep.count == 0
      render json: { message: params[:username] + " has not sleep yet"}, status: :unprocessable_entity
      return
    end
    
    previous_sleep.update({
      end_sleep: new_time
    })
    
    render json: { message: params[:username] + " wake up"}, status: :created
  end
end
