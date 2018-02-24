class UsersController < ApplicationController
  before_action :current_user, only: [:index]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def complete_problem
    user = User.find(session[:user_id])
    if (@user.num_attempt.nil?)
      user[:num_attempt] = 1
    else
      user[:num_attempt] += 1
    user.save()
  end

end
