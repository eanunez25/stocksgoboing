module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Boing"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end 
  end
  
  def business_days_between(date1, date2)
    business_days = 0
    date = date2
    while date > date1
      business_days = business_days + 1 unless date.saturday? or date.sunday?
      date = date - 1.day 
    end
    business_days
  end
end
