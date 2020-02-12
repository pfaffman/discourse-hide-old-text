module DiscourseHideOldText
  class Engine < ::Rails::Engine
    engine_name "DiscourseHideOldText".freeze
    isolate_namespace DiscourseHideOldText

    config.after_initialize do
      Discourse::Application.routes.append do
        mount ::DiscourseHideOldText::Engine, at: "/discourse-hide-old-text"
      end
    end
  end
end
