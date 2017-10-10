class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :order_details
  scope :sort_by_product, ->{order "created_at DESC"}
  scope :not_original, ->(id){where.not(id: id)}
end
