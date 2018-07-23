class Event < ApplicationRecord
  acts_as_votable
  after_create_commit { EventBroadcastJob.perform_later(@user, self) }

  def set_user(user)
    @user = user
  end
end
