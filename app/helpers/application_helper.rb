module ApplicationHelper

  def should_show_join_button?
    #are you the owner of the event? If no, proceed
    if @event.user.email != current_user.email
      #are you already registered for the events?
      if @event.attendances.find_by(user_id: current_user.id)
        #you can't join twice
        return false
      else
        #is there room for you?
        if @event.num_players > 0
          return true
          #render "attendances/form" %>
        else
          return false
          #<Event Full!
        end
      end
    end
  end

end
