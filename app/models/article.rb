class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximun: 50}
  validates :description, presence: true, length: {minimum: 3, maximun: 300}
end	