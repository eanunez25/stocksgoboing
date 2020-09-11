class ShortPut < ApplicationRecord
  belongs_to :user

  def dte 
    today = Date.today
    (expiration - today).to_i
  end

  def formatted_expiration
    expiration.strftime("%m-%d-%y") 
  end
end
