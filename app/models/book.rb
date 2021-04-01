class Book < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :author
    validates :publisher
    validates :image
    validates :price
    validates :genre_id
  end

  belongs_to :user
  has_one_attached :image

end
