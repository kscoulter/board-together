class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :game_name, :num_players, :time, presence: true, allow_blank: false
end
