class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post
    mail to: @post.user.email, subject: "投稿完了"
  end
end
