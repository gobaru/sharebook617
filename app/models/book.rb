class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title
    validates :author
    validates :publisher
    validates :image
    validates :price
    validates :genre_id
  end

  validates :genre_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
  belongs_to :genre

end
