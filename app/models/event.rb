class Event < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :clubs, through: :participants, dependent: :destroy
end
