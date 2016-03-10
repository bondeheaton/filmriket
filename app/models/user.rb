class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :personalnumber, presence: true
  validates :phonenumber, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :parentfirstname, presence: true
  validates :parentlastname, presence: true
  validates :parentphonenumber, presence: true
  validates :parentmail, presence: true
  validates :status, presence: true
  validates :agreement, presence: true
  validates :avatar, presence: true

  belongs_to :club
  has_many :movie_comments, dependent: :destroy
  has_many :reviews
  has_many :ratings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :club_movies
  has_many :wishes, dependent: :destroy
end
