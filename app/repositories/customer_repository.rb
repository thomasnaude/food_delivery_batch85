require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository

  private

  def build_element(row)
    Customer.new(row)
  end
end
