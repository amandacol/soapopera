class Soap < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :orders
  validates :name, presence: true
  validates :scent, presence: true
  validates :properties, presence: true
  validates :price, presence: true
  validates :weight, presence: true
end
