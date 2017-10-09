class Category < ApplicationRecord
  has_many :products
  scope :sort_by_category, ->{order :name}
end
