class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :agreement, presence: true
  belongs_to :club
  has_many :movie_comments
  has_many :reviews
  has_many :ratings
  has_one :bookings
end
