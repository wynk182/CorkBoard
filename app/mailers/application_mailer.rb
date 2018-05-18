class ApplicationMailer < ActionMailer::Base

  def response_message(to_email, mail_sub, mail_body)
    mail(
        to: to_email,
        from: 'wynk182@gmail.com',
        subject: mail_sub,
        body: mail_body
    )
  end

end