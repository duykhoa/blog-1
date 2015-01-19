ActiveAdmin.register Article do

  permit_params :title, :body, :published, :published_at, :thumbnail

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :published
    column :published_at
    actions
  end

  filter :title
  filter :published_at
  filter :category

  form do |f|
    f.inputs "Category Details" do
      f.input :category
      f.input :title
      f.input :body, :input_html => { class: "tinymce" }
      f.input :published
      f.input :published_at
      f.input :thumbnail
    end
    f.actions
  end
end
