# frozen_string_literal: true

# name: discourse-hide-old-text
# about: Hide Text by group and date
# version: 0.1
# authors: pfaffman
# url: https://github.com/pfaffman

register_asset 'stylesheets/common/discourse-hide-old-text.scss'
register_asset 'stylesheets/desktop/discourse-hide-old-text.scss'
register_asset 'stylesheets/mobile/discourse-hide-old-text.scss'

enabled_site_setting :discourse_hide_old_text_enabled

PLUGIN_NAME ||= 'DiscourseHideOldText'

load File.expand_path('lib/discourse-hide-old-text/engine.rb', __dir__)

after_initialize do
  # https://github.com/discourse/discourse/blob/master/lib/plugin/instance.rb


  require_dependency 'post_serializer'
  class ::PostSerializer

    # attributes :qa_vote_count,
    #            :qa_voted,
    #            :qa_enabled,
    #            :last_answerer,
    #            :last_answered_at,
    #            :answer_count,
    #            :last_answer_post_number,
    #            :last_answerer

    def allowed_groups
      SiteSetting.hide_old_text_allowed_groups.split('|').map { |x| x.to_i }
    end

    def cooked
      puts "finding topic: #{object.topic_id}"
      topic = Topic.find(object.topic_id)
      copies = 1 + object.raw.length / SiteSetting.hide_old_text_replacement_text.length
      puts "copies: #{copies}"
      if SiteSetting.discourse_hide_old_text_enabled &&
         post_number > 1 &&
         topic.created_at < SiteSetting.hide_old_text_days.days.ago
        if ( scope.current_user &&
             !(scope.current_user.group_ids & allowed_groups).empty? )
          super
        else
          link = ""
          if scope.current_user
            # logged in user gets signup link
            link = "<a href=\"#{SiteSetting.hide_old_text_signup_url}\">#{SiteSetting.hide_old_text_signup_text}</a>\n<br />\n<br />\n"
          else
            # guest gets login link
            link = "<a href=\"#{SiteSetting.hide_old_text_login_url}\">#{SiteSetting.hide_old_text_login_text}</a>\n<br />\n<br />\n"
          end

          link +
            '<div class="discourse-hide-old-text-blur">' +
            SiteSetting.hide_old_text_replacement_text * copies +
            '</div>'
        end
      else
        super
      end
    end

    # def last_answerer
    #   object.topic.last_answerer
    # end

    # def include_last_answerer?
    #   object.qa_enabled
    # end
  end

  # Post.register_custom_field_type('vote_count', :integer)

  # class ::Post
  #   after_create :qa_update_vote_order, if: :qa_enabled

  #   cooked = "this is some text"
  # end

end
