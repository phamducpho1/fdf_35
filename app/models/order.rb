class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  validates :phone, presence: true, numericality: true,
    length: {minimum: Settings.oder.minimum_length, maximum: Settings.oder.maxnimum_length}
  validates :address, presence: true
end
