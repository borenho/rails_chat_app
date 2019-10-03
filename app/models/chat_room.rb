class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy, inverse_of: :chat_room
  has_many :users, through: :messages
  
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
