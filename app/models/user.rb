class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bull_put_spreads
  has_many :short_puts
  has_many :bear_call_spreads
  has_many :short_calls
  has_many :equities
  has_many :companies
  has_many :comments, through: :companies
end
