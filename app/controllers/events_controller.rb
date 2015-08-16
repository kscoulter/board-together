class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @events = Event.all.order(:time)
  end

  def show
    @event = Event.find(params[:id])

    if @event.attendances.find_by(user_id: current_user.id)
      @attendance = @event.attendances.find_by(user_id: current_user.id)
    else
      @attendance = Attendance.new
    end

    @attendances = Attendance.all
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @event = current_user.events.create(event_params)
    redirect_to event_path(@event)
  end

    def edit
      @event = Event.find(params[:id])
    end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to user_events_path(current_user)
  end

  private
  def event_params
    params.require(:event).permit(:game_name,:num_players,:time, :location, :description, :user_id)
  end
end
