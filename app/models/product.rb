class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :order_details
  has_many :line_items
  scope :sort_by_product, ->{order "created_at DESC"}
  scope :sort_by_products, ->{order :name}
  scope :not_original, ->(id){where.not(id: id)}
  scope :find_category, ->(q){where category_id: q if q.present?}
end
