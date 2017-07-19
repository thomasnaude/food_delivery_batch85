require_relative "base_repository"
require_relative "../models/employee"

class EmployeeRepository < BaseRepository

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def delivery_guys
    @elements.select { |employee| employee.delivery_guy? }
  end

  private

  def build_element(row)
    Employee.new(row)
  end
end
