=begin

STATUS REDO!!!
Didn't have right logic, need to change it so it doesn't look for first nil, looks instead for last index

Your task is to write a CircularBuffer class that implements a circular buffer for arbitrary objects.
The class should obtain the buffer size with an argument provided to CircularBuffer::new, and should provide the following methods:

    put to add an object to the buffer
    get to remove (and return) the oldest object in the buffer. It should return nil if the buffer is empty.

You may assume that none of the values stored in the buffer are nil (however, nil may be used to designate empty spots in the buffer).
=end

class CircularBuffer

  attr_reader :fixed_length_array

  def initialize size
    @size = size
    @move_history = []
    @fixed_length_array = Array.new(size)
  end

  def get
    return nil if empty_buffer?
    move_history.clone
  end

  def put object_to_add
    idx_first_nil = fixed_length_array.index(nil)
    if !!idx_first_nil
      idx_first_nil
      @fixed_length_array[idx_first_nil] = object_to_add
    else
      "array is full"
    end
    # @fixed_length_array << object_to_add
  end

  private

  def empty_buffer?
    fixed_length_array.all?(nil)
  end

  attr_accessor :move_history
end

def app
  buffer = CircularBuffer.new(3)
  p buffer
  p buffer.get
  p buffer.fixed_length_array
  p buffer.put "FirstIsTheWorst"
  p buffer.fixed_length_array
  p buffer.put "TwoMuchTooHandle"
  p buffer.fixed_length_array
  p buffer.put "ThirdTimesTheCharm"
  p buffer.fixed_length_array
  p buffer.put "FoursChestIsHarry"
  p buffer.fixed_length_array
  return
  puts buffer.get == nil

  buffer.put(1)
  buffer.put(2)
  puts buffer.get == 1

  buffer.put(3)
  buffer.put(4)
  puts buffer.get == 2

  buffer.put(5)
  buffer.put(6)
  buffer.put(7)
  puts buffer.get == 5
  puts buffer.get == 6
  puts buffer.get == 7
  puts buffer.get == nil

  buffer = CircularBuffer.new(4)
  puts buffer.get == nil

  buffer.put(1)
  buffer.put(2)
  puts buffer.get == 1

  buffer.put(3)
  buffer.put(4)
  puts buffer.get == 2

  buffer.put(5)
  buffer.put(6)
  buffer.put(7)
  puts buffer.get == 4
  puts buffer.get == 5
  puts buffer.get == 6
  puts buffer.get == 7
  puts buffer.get == nil
end

app()
