class FreelancerMailer < ActionMailer::Base
  layout 'mailers'

  def contact_me(email)
    mail(to: email, subject: 'Заявка получена.')
  end
end
