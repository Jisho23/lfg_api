class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json()
  end

  def show
    user = User.find(params['id'])
    render json: user.package_json
  end

  def createUser
     user = User.new(create_user_params)
     if user.valid?
       user.save
       render json: user.package_json
     else
       render json: {error: 'Invalid User Input', status: '400'}
     end
  end

end
