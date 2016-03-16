ActiveAdmin.register Purpose do

  permit_params :name, :full_description, :data_subjects, :data_categories, :data_recipients, :additional_info, :storage_limit, :data_sensitive, :security_policy

end
