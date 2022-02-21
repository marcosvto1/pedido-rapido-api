# frozen_string_literal: true
class Employee < ActiveRecord::Base
  extend Devise::Models
  include Searchable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true

  enum type_profile: {
    admin: 1,
    cook: 2,
    attendant: 3,
  }
end
