class EntityTransfer < ApplicationRecord
  belongs_to :entity
  belongs_to :transfer

  validates_presence_of :entity_id, :transfer_id
end
