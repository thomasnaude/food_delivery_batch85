require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  def destroy(meal_id)
    @elements.delete_if { |element| element.id == meal_id }
    write_csv
  end

  private

  def build_element(row)
    Meal.new(row)
  end
end
