class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(to_adress,guest,url)
    @guest = guest
    @url = url

    mail(
      to: to_adress ,
      subject: "面接情報が更新されました"
      )
  end
end
