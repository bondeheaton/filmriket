class Wish < ActiveRecord::Base
  validates :message, presence: true

  belongs_to :user, dependent: :destroy
end
