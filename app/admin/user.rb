ActiveAdmin.register User do
  permit_params :is_admin

  index do
    selectable_column
    column :username
    column :is_admin
    column :created_at
    actions
  end

  filter :username
  filter :is_admin
  filter :created_at

  form do |f|
    f.inputs "Details" do
      f.input :is_admin
    end
    f.actions
  end

end
