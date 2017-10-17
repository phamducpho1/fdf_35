class Suggest < ApplicationRecord
  belongs_to :user
  scope :order_iduser, ->{order :user_id}
end
