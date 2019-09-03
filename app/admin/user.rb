ActiveAdmin.register User do
  permit_params :username

  index do
    selectable_column
    id_column
    column :username
    column :sso_guid
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :username
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :username
    end
    f.actions
  end

  controller do
    def create
      @user = User.new(permitted_params[:user])

      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end
  end
end
