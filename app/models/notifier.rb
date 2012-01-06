class Notifier < ActionMailer::Base
  default_url_options[:host] = APP_CONFIG[:site_root]

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          APP_CONFIG[:site_name]
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
  
  def verification_instructions(user)
    subject       "Email Verification"
    from          APP_CONFIG[:site_name]
    recipients    user.email
    sent_on       Time.now
    body          :user_verification_url => user_verification_url(user.perishable_token)
  end
end
