class Transfer < ApplicationRecord
  has_many :purpose_transfers
  has_many :purposes, through: :purpose_transfers
  has_many :entity_transfers
  has_many :entities, through: :entity_transfers

  belongs_to :transfer_type

  validates_presence_of :name, :transfer_type_id
end
