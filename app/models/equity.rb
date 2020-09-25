class Equity < ApplicationRecord
  belongs_to :user

  validates :ticker, presence: true, uniqueness: true
  validates :buy_price, presence: true
  validates :valuation, presence: true

  before_save :uppercase

  def uppercase
    ticker.upcase!
  end
end
