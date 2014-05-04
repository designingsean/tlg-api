class UsersController < ApplicationController
  def index
    @users = Users.select(:id, :name, :active) \
                      .where(active: true) \
                      .order(:name)
    render json: @users
  end

  def inactive
    @users = Users.select(:id, :name, :active) \
                      .where(active: false) \
                      .order(:name)
    render json: @users
  end

  def update
    user = Users.find(params[:id])
    user.toggle(:active)
    user.save
  end

  def create
    Users.create(name: params[:name])
  end
end