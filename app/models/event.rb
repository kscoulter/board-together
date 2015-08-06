class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :comments, dependent: :destroy
end
