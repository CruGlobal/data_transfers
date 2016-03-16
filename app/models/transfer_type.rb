class TransferType < ApplicationRecord
  has_many :transfers

  validates_presence_of :name
end
