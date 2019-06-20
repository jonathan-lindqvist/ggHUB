# frozen_string_literal: true

# How the mail looks
class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@gghub.com'
  layout 'mailer'
end
