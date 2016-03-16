class PurposeTransfer < ApplicationRecord
  belongs_to :purpose
  belongs_to :transfer

  validates_presence_of :purpose_id, :transfer_id
end
