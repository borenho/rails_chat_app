class Message < ApplicationRecord
  belongs_to :chat_room, inverse_of: :messages
  belongs_to :user
end
