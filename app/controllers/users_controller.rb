class UsersController < ApplicationController
  def index
    @users = Users.select(:id, :name, :active) \
                      .where(:active => 1) \
                      .order(:name)
    render json: @users
  end

  def inactive
    @users = Users.select(:id, :name, :active) \
                      .where(:active => 0) \
                      .order(:name)
    render json: @users
  end

  def edit
    user = Users.find(params[:id])
    user.toggle(:active)
    user.save
  end

  def create
    user = Users.create(name: params[:name])
  end
end