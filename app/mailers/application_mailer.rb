class ApplicationMailer < ActionMailer::Base
  default from: "orders@millicentpenner.com"
  layout "mailer"
end
