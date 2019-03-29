class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  def to_pst
    in_time_zone('Pacific Time (US & Canada)')
  end

  def message_time
    created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%m/%d/%y at %l:%M %p")
  end

end
