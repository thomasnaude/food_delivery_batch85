class BaseView
  def ask_for(attribute)
    puts "#{attribute} ?"
    print "> "
    gets.chomp
  end
end
