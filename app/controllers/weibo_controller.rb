class WeiboController < ApplicationController
  def connect
    WeiboOAuth2::Config.api_key = '2995749339';
    WeiboOAuth2::Config.api_secret = '8935c930b08d4f96fabcce32474a250a';
    WeiboOAuth2::Config.redirect_uri = 'http://127.0.0.1:3000/callback'

    client = WeiboOAuth2::Client.new
    redirect_to client.authorize_url
  end

  def callback
    #client = WeiboOAuth2::Client.new
    #access_token = client.auth_code.get_token(params[:code].to_s)
    #session[:uid] = access_token.params["uid"]
    #session[:access_token] = access_token.token
    #session[:expires_at] = access_token.expires_at
    #p "*" * 80 + "callback"
    #p access_token.inspect
    #@user = client.users.show_by_uid(session[:uid].to_i)
    #redirect_to '/'
    client = WeiboOAuth2::Client.new
    access_token = client.auth_code.get_token(params[:code].to_s)

    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at


    @user = client.users.show_by_uid(session[:uid].to_i)
    redirect_to '/'

  end

  def post
    ##render params[:game].inspect
    #game = Game.find_by_name(params[:game][:name])
    #status = game.name
    ##pic = File.open(game.game_cover.url)
    #
    #client = WeiboOAuth2::Client.new
    ##client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]})
    ##statuses = client.statuses
    #
    #statuses.upload(status, game.game_cover.url)


    client = WeiboOAuth2::Client.new
    client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]})
    statuses = client.statuses

    #unless params[:file] && (pic = params[:file].delete(:tempfile))
      statuses.update("haha")
    #else
      #status = params[:status] || '图片'
      #statuses.upload(status, pic, params[:file])
    #end

    redirect '/'

  end
end
