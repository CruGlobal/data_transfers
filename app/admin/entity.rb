ActiveAdmin.register Entity do
  permit_params :name, :legal_name, :legal_other, :address, :telephone, :fax, :email, :dp_reg, :dp_contact, :signatory, :is_eea, :country, :area, :is_areaoffice, :description

  form do |f|
    f.inputs do
      f.input :name
      f.input :legal_name
      f.input :legal_other
      f.input :address
      f.input :telephone
      f.input :fax
      f.input :email
      f.input :dp_reg
      f.input :dp_contact
      f.input :signatory
      f.input :is_eea
      f.input :country, as: :string
      f.input :area
      f.input :is_areaoffice
      f.input :description
    end
    f.actions
  end
end
