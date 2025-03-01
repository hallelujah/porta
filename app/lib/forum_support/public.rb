# frozen_string_literal: true

module ForumSupport
  # Mix in this module into public-side controllers (forum, topic, post, ...)
  module Public
    def self.included(base)
      base.skip_before_action :login_required
      base.before_action :render_not_found_if_forum_disabled
      base.before_action :login_required_unless_public

      base.before_action :find_forum
      base.liquify
    end

    private

    def render_not_found_if_forum_disabled
      render_error('Page not found', status: :not_found) unless site_account.forum_enabled?
    end

    def login_required_unless_public
      login_required unless site_account.settings.forum_public?
    end

    def find_forum
      @forum = site_account.forum
    end
  end
end
