require "rails_helper"
RSpec.describe Product, type: :model do

  context "associations" do
    it {should have_many :ratings}
    it {should have_many :order_details}
    it {should have_many :line_items}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :price}
    it {is_expected.to validate_presence_of :quanlity}
    it {is_expected.to validate_presence_of :information}
  end

end
