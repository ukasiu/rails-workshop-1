class Book < ActiveRecord::Base
  belongs_to :publisher
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :authors
  
  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :isbn, presence: true
  validates :label_id, presence: true


end
