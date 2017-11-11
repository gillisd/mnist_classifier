class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login_user

  def current_user
    User.find_by_session_id(session.id)
  end

  def login_user
    session['init'] = true
    User.find_or_create_by!(session_id: session.id)
  end
end
