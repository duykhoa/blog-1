module PaperclipStorageOption
  module ClassMethods
    def options
      Rails.env.production? ? production_options : default_options
    end

    def production_options
        {
          storage: :s3,
          s3_credentials: Rails.root.join("config/application.yml")
        }
    end

    def default_options
      {}
    end
  end

  extend ClassMethods
end
