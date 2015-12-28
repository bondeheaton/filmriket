class Filmschool < ActiveRecord::Base
  has_many :filmschool_comments, dependent: :destroy
end
