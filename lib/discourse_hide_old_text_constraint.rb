class DiscourseHideOldTextConstraint
  def matches?(request)
    SiteSetting.discourse_hide_old_text_enabled
  end
end
