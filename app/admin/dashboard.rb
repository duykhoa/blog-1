ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Summary" do
          div do
            small "Total post:"
            small Article.count
          end

          div do
            small "User count:"
            small User.count
          end

          div do
            small "Category:"
            small Category.count
          end
        end
      end

      column do
        panel "Recent Posts" do
          Article.first(3).each do |article|
            div do
              link_to article.title, admin_article_path(article)
            end
          end
        end
      end

      column do
        panel "Article with most comments" do
          Article.most_comments.each do |article|
            div do
              div article.title
              strong "Comments: #{article.comments_count}"
            end
          end
        end
      end
     end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
