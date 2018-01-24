module UsersHelper
  def age_calculation(birthday)
    (Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
  end
end
