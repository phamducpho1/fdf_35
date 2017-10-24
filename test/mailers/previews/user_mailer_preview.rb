class UserMailerPreview < ActionMailer::Preview
  def mailer_order
    user = Order.last
    UserMailer.mailer_order user
  end

  def mailer_status
    order = Order.last
    UserMailer.mailer_status order
  end
end
