class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user, event)
    ActionCable.server.broadcast 'activity_channel', message: render_event(user, event)
  end

  private

  def render_event(user, event)
    ApplicationController.render_with_signed_in_user(user, partial: 'events/event', locals: { event: event })
  end

end
