class VoluntaryCoreModuleEmberjs::ApplicationController < ApplicationController
  before_filter :preload_json
  
  protected
  
  def render_json_error(obj)
    errors = obj.respond_to?(:errors) ? obj.errors.full_messages : obj
    render json: MultiJson.dump(errors: errors), status: 422
  end
  
  private

  # If we are rendering HTML, preload the session data
  def preload_json
    return unless request.format && request.format.html? && current_user.present?
    
    store_preloaded("currentUser", MultiJson.dump(CurrentUserSerializer.new(current_user, root: false)))
  end
  
  def log_on_user(user)
    session[:current_user_id] = user.id
    
    unless user.auth_token && user.auth_token.length == 32
      user.auth_token = SecureRandom.hex(16)
      user.save!
    end
    
    set_permanent_cookie!(user)
  end
  
  def set_permanent_cookie!(user)
    cookies.permanent["_t"] = { value: user.auth_token, httponly: true }
  end

=begin  
  def current_user
    return @current_user if @current_user# || @not_logged_in

    if session[:current_user_id].blank?
      # maybe we have a cookie?
      @current_user = User.lookup_from_auth_token(cookies["_t"])
      session[:current_user_id] = @current_user.id if @current_user
    else
      @current_user ||= User.where(id: session[:current_user_id]).first
    end

    @not_logged_in = session[:current_user_id].blank?

    unless @current_user
      # possible we have an api call, impersonate 
      raise NotImplementedError
      
      return unless api_key = request["api_key"] 
      return unless api_user_name = request["api_user_name"]
      return unless api_key_valid?(api_key)
            
      @current_user = User.where(name: api_user_name.downcase).first
    end

    @current_user
  end
=end
  
  def api_key_valid?
    raise NotImplementedError
  end
  
  def store_preloaded(key, json)
    @preloaded ||= {}
    
    # I dislike that there is a gsub as opposed to a gsub!
    #  but we can not be mucking with user input, I wonder if there is a way
    #  to inject this safty deeper in the library or even in AM serializer
    @preloaded[key] = json.gsub("</", "<\\/")
  end
  
  def access_denied(exception)
    request.xhr? || request.format.try('json?') ? render(text: 'Access denied!') : redirect_to(root_path, alert: "<b>#{exception.message}</b>")
  end
  
  def not_found(e)
    if Rails.env.development?
      raise e
    elsif request.xhr? || request.format.try('json?')
      render_json_error(['Page not found'])
      #render json: { error: 'Page not found.' }
    else
      if ['staging', 'production'].include? Rails.env.to_s
        render nothing: true, status: 404
      else
        redirect_to root_path, alert: 'Page not found.'
      end
    end
  end
end