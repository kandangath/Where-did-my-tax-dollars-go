class UserSession < Authlogic::Session::Base
  
  validate :check_if_verified if APP_CONFIG[:verify_new_accounts]
  
  
  #=======================PRIVATE METHODS=========================
  private
  #===============================================================
  
  def check_if_verified
    errors.add(:base, "You have not yet verified your account") unless attempted_record && attempted_record.verified
  end
end