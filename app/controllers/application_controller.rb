class ApplicationController < ActionController::Base
    include Knock::Authenticable

    protected

    # method untuk mengecek apakah user admin atau tidak
    def authorize_as_admin
      return_unauthorized unless !current_user.nil? && current_user.is_admin?
    end


end
