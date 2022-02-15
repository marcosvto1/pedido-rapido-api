# frozen_string_literal: true

class Employee < ActiveRecord::Base
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum type_profile: {
    admin: 1,
    cook: 2,
    attendant: 3,
  }
end
