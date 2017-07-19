class Employee
  attr_reader :username, :role
  attr_accessor :id

  def initialize(args = {})
    @id = args[:id]
    @username = args[:username]
    @password = args[:password]
    @role = args[:role] || "delivery_guy"
  end

  def password_is?(password)
    @password == password
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end
