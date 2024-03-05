=begin
Question:
We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”`
Why does our `change_info` method not work as expected?


=end
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.
<<~Answer

got to add `self`! This ensures we are calling the setter methods.
Alternatively we are simply assigning arguments to local variables, that we are doing nothing with...
Answer

