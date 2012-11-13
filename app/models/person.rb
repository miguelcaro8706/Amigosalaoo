class Person < ActiveRecord::Base
  attr_accessible :full_name, :email

  validates :email, uniqueness: true, presence: true
  validates :full_name, presence: true
end
