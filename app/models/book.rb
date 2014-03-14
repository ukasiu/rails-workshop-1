class Book < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 255}
  validates :isbn, presence: true
  validates :label_id, presence: true
end
