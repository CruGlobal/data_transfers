ActiveAdmin.register Entity do
  permit_params :name, :legal_name, :legal_other, :address, :telephone, :fax, :email, :dp_reg, :dp_contact, :signatory, :is_eea, :country, :area, :is_areaoffice, :description
end
