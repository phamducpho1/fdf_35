class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  scope :sort_by_category, ->{order :name}
end
