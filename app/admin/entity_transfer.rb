ActiveAdmin.register EntityTransfer do
  permit_params :entity_id, :transfer_id, :is_recipient
end
