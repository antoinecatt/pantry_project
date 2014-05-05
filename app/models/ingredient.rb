class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  key = ENV['YUMMLY_KEY']

end
