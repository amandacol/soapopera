class Soap < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :orders
  validates :name, presence: true
  validates :scent, presence: true
  validates :properties, presence: true
  validates :price, presence: true
  validates :weight, presence: true
  include PgSearch::Model

  pg_search_scope :search_by_name_and_scent,
    against: [ :name, :scent, :properties ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
