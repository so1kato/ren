class SitesController < ApplicationController
  before_action :check_logined, except: [:login, :auth, :logout]

  def index
  end

  def login
  end

  def auth
    administrator = Administrator.authenticate(params[:email], params[:password])
    if administrator then
      reset_session
      session[:admin_id] = administrator.id
      session[:admin_name] = administrator.name
      if params[:referer] != nil then
        redirect_to params[:referer]
      else
        redirect_to '/'
      end
    else
      flash.now[:referer] = params[:referer]
      @error = "メールアドレス/パスワードが正しくありません"
      render 'login'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
