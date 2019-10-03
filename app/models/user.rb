class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :chat_rooms, through: :messages

  validates :username, uniqueness: true, presence: true
end
