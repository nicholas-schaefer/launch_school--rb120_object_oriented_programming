

=begin
51
# The following is a short description of an application that lets a customer place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.
=end

<<~Answer
Nouns
  Meal
  Burger
  Side
  Drink
  Customer
  Cost

Verbs
  choose_an_option
  calculate_cost

Answer

class Customer
  attr_reader :name, :order, :discount_percentage_off, :final_bill

  def initialize(name)
    self.name = name
    @final_bill
  end

  def choose_menu_items(burger, side, drink)
    self.order = MealOrder.new(burger, side, drink)
  end

  def request_discount_percentage_off(percent_off)
    self.discount_percentage_off = percent_off
  end

  def apply_discount_to_bill
    self.final_bill = sprintf('%.2f',order.cost_subtotal * ((100 - discount_percentage_off) * 0.01))
  end
  private

  attr_writer :name, :order, :discount_percentage_off, :final_bill
end

class MealOrder
  PRICING = {
    turkey_burger: 14.25,
    french_fries: 4.95,
    coke: 2.87,
  }

  def initialize(burger, side, drink)
    self.burger = burger
    self.side =   side
    self.drink =  drink
    self.cost_subtotal = calculate_subtotal_cost
    # self.cost_total = calculate_total_cost
    # self.cost_total = calculate_total_cost
  end

  def calculate_subtotal_cost
    PRICING[burger.to_sym] + PRICING[side.to_sym] + PRICING[drink.to_sym]
  end

  attr_accessor :cost_subtotal

  private

  attr_accessor :burger, :side, :drink

end

class RestaurantExperiences
  def self.take_order
    customer1 = Customer.new("Nick")
    customer1.choose_menu_items("turkey_burger", "french_fries", "coke")
    p customer1
    customer1.request_discount_percentage_off(20)
    customer1.apply_discount_to_bill
    p customer1
  end
end

RestaurantExperiences.take_order
