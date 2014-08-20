class Student < ActiveRecord::Base
  validates :first_name, presence: true,
  	:length => {:minimum=>4}
  validates :last_name, presence: true,
  	:length => {:minimum=>4},
  	:uniqueness => true
end
