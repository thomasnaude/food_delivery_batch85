require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  private

  def build_element(row)
    Meal.new(row)
  end
end
