class Purpose < ApplicationRecord
  has_many :purpose_transfers
  has_many :transfers, through: :purpose_transfers

  validates_presence_of :name, :full_description, :data_subjects, :data_categories, :data_recipients, :storage_limit, :data_sensitive, :security_policy
end
