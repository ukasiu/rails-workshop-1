class Book < ActiveRecord::Base
  belongs_to :publisher
  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :isbn, presence: true
  validates :label_id, presence: true
end
