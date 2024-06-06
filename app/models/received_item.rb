class ReceivedItem < ApplicationRecord
  belongs_to :user
  belongs_to :consume_item, optional: true
  belongs_to :weapon_item, optional: true
end
