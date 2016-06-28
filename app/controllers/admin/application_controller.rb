class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "admin"
  def to_boolean string
     ActiveRecord::Type::Boolean.new.type_cast_from_user (string)
    #code
  end
end
