class BullPutSpread < ApplicationRecord
  belongs_to :user
  validates :strike, presence: true
  validates :asset, presence: true

  scope :open, -> { where('expiration >= ?', Date.today) }
  scope :closed, -> { where('expiration < ?', Date.today) }

  def dte 
    today = Date.today
    (expiration - today).to_i
  end

  def formatted_expiration
    expiration.strftime("%m-%d-%y") 
  end
end
