class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include OwnerSession
  before_action :set_owner
end