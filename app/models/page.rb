class Page < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  attribute :phone, validate: true
  validates :phone, numericality: true
  attribute :message, validate: true

  def headers
    {
      # this is the subject for the email generated, it can be anything you want
      # subject: "My Contact Form",
      subject: "Formulário de teste",
      # to: 'your.email@yourdomain.com',
      to: 'wagontestpilot@gmail.com',
      from: %("#{name}" <#{email}>)
      # the from will display the name entered by the user followed by the email
    }
  end
end
