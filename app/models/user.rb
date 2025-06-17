# frozen_string_literal: true

class User < ApplicationRecord
  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Attributes
  # - email: string
  # - first_name: string
  # - last_name: string
  # - phone_number: string
  # - date_of_birth: date
  # - address: string
  # - city: string
  # - state: string
  # - country: string
  # - postal_code: string
  # - role: string
  # - status: string
  # - last_login_at: datetime
  # - created_at: datetime
  # - updated_at: datetime

  # Scopes
  scope :active, -> { where(status: 'active') }
  scope :inactive, -> { where(status: 'inactive') }

  # Methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def active?
    status == 'active'
  end
end 