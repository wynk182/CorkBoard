module OwnerSession
  extend ActiveSupport::Concern
  private
  def set_owner
    unless (@owner = Owner.find_by_code(session[:code]))
      @owner = nil
    end
  end
end
