class Entity < ApplicationRecord
  has_many :entity_transfers
  has_many :transfers, through: :entity_transfers

  validates_presence_of :name, :legal_name, :country
end
