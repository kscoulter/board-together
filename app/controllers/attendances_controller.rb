class AttendancesController < ActionController::Base
  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    # You could also do @event.attendances.create(user: current_user)
    Attendance.create(event: @event, user: current_user)
    @players_needed = @event.num_players
    @event.update(num_players: @players_needed-1)

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.find_by(user_id: current_user.id)
    @attendance.destroy
    # Can scoot these into one line: @event.attendances.find_by(user: current_user.id).destroy, but that makes for a long line
    @players_needed = @event.num_players
    @event.update(num_players: @players_needed+1)
    redirect_to event_path(@event)
  end

end
