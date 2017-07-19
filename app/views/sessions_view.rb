require_relative "base_view"

class SessionsView < BaseView
  def sign_in_confirmation
    puts "*** You are signed in ! ***"
  end

  def wrong_credentials
    puts "*** Wrong username or password ***"
  end
end
