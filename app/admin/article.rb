ActiveAdmin.register Article do

  permit_params :title, :body, :published, :published_at

  index do
    selectable_column
    id_column
    column :title
    column :body
    actions
  end

  filter :title
  filter :published_at

  form do |f|
    f.inputs "Category Details" do
      f.input :title
      f.input :body
    end
    f.actions
  end
end
