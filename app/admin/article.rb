ActiveAdmin.register Article do

  permit_params :title, :body, :published, :published_at, :thumbnail, :category_id, :address

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
      f.input :category_id, :as => :select, :collection => Category.all
      f.input :title
      f.input :body, :input_html => { class: "tinymce" }
      f.input :published
      f.input :published_at, :as => :datetime_picker
      f.input :thumbnail
    end
    f.actions
  end

  controller do
    before_action :address, only: [:update, :create]
    def update
      super
    end

    def create
      super
    end

    def lookup_ip_location
      if Rails.env.development?
        Geocoder.configure(timeout: 500)
        @location = Geocoder.search(request.remote_ip).first
      else
        @location = request.location
      end
    end

    def address
      params[:article][:address] = lookup_ip_location.address if lookup_ip_location
    end
  end
end
