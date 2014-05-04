class ClockController < ApplicationController
  def show
    @clock = Clock.where(uid: params[:id]).last
    render json: @clock
  end

  def create
    Clock.create(uid: params[:user], clockIn: params[:start], clockOut: params[:end])
  end

  def update
    clock = Clock.find(params[:id])
    clock.clockOut = params[:end]
    clock.save
  end

  def destroy
    Clock.destroy(params[:id])
  end

  def range
    daterange = params[:start]..params[:end]
    @clock = Clock.select('id,
                            DATE_FORMAT(clockIn, "%a, %b %e") as clockInDate,
                            DATE_FORMAT(clockIn, "%l:%i %p") as clockInTime,
                            DATE_FORMAT(clockOut, "%l:%i %p") as clockOutTime,
                            ROUND(TIMESTAMPDIFF(MINUTE, clockIn, clockOut)/60, 2) as totalTime') \
                  .where(uid: params[:user], clockIn: daterange) \
                  .order(:clockIn) \
                  .reverse_order
    render json: @clock
  end
end