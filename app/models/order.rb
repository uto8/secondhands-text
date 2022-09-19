class Order < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :item
end
