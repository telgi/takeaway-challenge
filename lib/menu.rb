class Menu

  attr_reader :meals, :order

  def initialize(order = Order.new)
    @meals = {
      pappadom: 0.50,
      chutney: 0.50,
      samosa: 2.25,
      curry: 6.50,
      tandoori_grill: 8.95,
      veg_side: 2.75,
      rice: 1.95,
      naan: 1.80
    }
    @order = order
  end

  def print
    i = 1
    @meals.each do |meal, price|
      puts "#{i}. " + meal.to_s + " : £" + sprintf('%.2f', price)
      i += 1
    end
  end

  def select_item
    puts "What would you like to order?"
    @item = STDIN.gets.chomp.downcase.to_sym
    select_quantity
  end

  def select_quantity
    puts "How many would you like?"
    @quantity = STDIN.gets.to_i
    @order.add(@item, @quantity)
    add_extra
  end

  def add_extra
    puts "Anything else? ( yes / no )"
    extra = STDIN.gets.chomp.downcase
    "yes" ? select_item : finished?
  end

  def finished?
    puts "are you ready to checkout? ( yes / no)"
    answer = STDIN.gets.chomp.downcase
    "yes" ? exit : select_item
  end

end
