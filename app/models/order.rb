class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  validates :phone, presence: true, numericality: true
  validates :address, presence: true
  enum status: {handled: 0, not_handle: 1}
  scope :sort_by_id, ->{order :id}
end
