module DiscourseHideOldText
  class DiscourseHideOldTextController < ::ApplicationController
    requires_plugin DiscourseHideOldText

    before_action :ensure_logged_in

    def index
    end
  end
end
