class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours_open)
    (opening_time.to_i + hours_open).to_s + ":00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    opening_time.to_i < 12 ? true : false
  end

  def menu_dish_names
    dishes.map do |dish|
      dish.upcase
    end
  end

  def announce_closing_time(hours_open)
    twelve_hr_closing_time =
      if closing_time(hours_open).to_i <= 12
        "#{closing_time(hours_open)} AM"
      else
        "#{closing_time(hours_open).to_i - 12}:00 PM"
      end

    "#{name} will be closing at #{twelve_hr_closing_time}"
  end
end
