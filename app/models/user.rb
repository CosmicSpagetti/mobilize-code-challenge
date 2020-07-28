class User < ApplicationRecord
  before_validation :format_and_check_number

  has_secure_password

  validates_presence_of :name,
                        :password_digest

  validates :phone_number, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, message: 'wrong. Put a real number!' }, presence: true

  def format_and_check_number
    self.phone_number = ActionController::Base.helpers.number_to_phone(self.phone_number)
  end
end
