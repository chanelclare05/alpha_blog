class Article < ApplicationRecord
  belongs_to :user
  #There are many validations to do this 
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 6, maximum: 255}
end 