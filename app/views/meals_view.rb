require_relative "base_view"

class MealsView < BaseView
  def display(meals)
    meals.each_with_index do |meal, i|
      puts "#{i + 1} - #{meal.name} - #{meal.price}€"
    end
  end
end
