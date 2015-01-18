ActiveAdmin.register Article do

  permit_params :title, :body, :published, :published_at, :thumbnail

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :published
    actions
  end

  filter :title
  filter :published_at
  filter :category

  simple_form_for @article do |f|
    f.inputs "Category Details" do
      f.input :title
      f.input :body, :input_html => {:class => 'summernote'}
      f.input :published
      f.input :thumbnail
    end
    f.actions
  end
end
