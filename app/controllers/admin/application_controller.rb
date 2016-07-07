class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_logined

  private
    def check_logined
      if session[:admin_id] then
        begin
          @administrator = Administrator.find(session[:admin_id])
        rescue ActiveRecord::RecordNotFound
          reset_session
        end
      end

      unless @administrator
        flash[:referer] = request.fullpath
        redirect_to controller: :sites, action: :login
      end
    end
end
