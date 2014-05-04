class CallsController < ApplicationController
  def index
    @calls = Calls.select('id,
                            name,
                            phone,
                            message,
                            DATE_FORMAT(received, "%Y%m%dT%H%i%s") as received,
                            completed') \
                      .where(completed: false) \
                      .order(:received)
    render json: @calls
  end

  def complete
    @calls = Calls.select('id,
                            name,
                            phone,
                            message,
                            DATE_FORMAT(received, "%Y%m%dT%H%i%s") as received,
                            completed') \
                      .where(completed: true) \
                      .order(:received)
    render json: @calls
  end

  def update
    call = Calls.find(params[:id])
    call.toggle(:completed)
    call.save
  end

  def create
    Calls.create(name: params[:name], phone: params[:phone], message: params[:message], received: params[:received])
  end
end