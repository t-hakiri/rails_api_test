class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :set_session, except: [:create]
  before_action :require_login

  @session = {}

  def require_login
    render json: { error: 'unauthorized' }, status: :unauthorized if @session.empty?
  end

  private
  def set_session
    authenticate_or_request_with_http_token do |token, options|
      @session = Session.get(token)
    end
  end
end