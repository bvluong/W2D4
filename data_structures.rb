require "byebug"

class MyQueue

  def initialize
    @store = []
  end

  def enqueue(ele)
    @store.unshift(ele)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end


class StackQueue

  def initialize
    @enstack = Stack.new
    @destack = Stack.new
  end

  def enqueue(ele)
    @enstack.push(ele)
  end


  def dequeue
    until enstack.empty?
      @destack.push(@enstack.pop)
    end
    @destack.pop
  end

end

class MinMaxStack

  def initialize
    @store = MyStack.new()
  end

  def pop
    @store.pop
  end

  def min
    empty? ? nil : @store.peek.values[0][0]
  end

  def max
    empty? ? nil : @store.peek.values[0][1]
  end

  def push(ele)
    newhash = Hash.new
    newhash[ele] = find_min(ele),find_max(ele)
    @store.push(newhash)
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def find_max(ele)
    empty? ? ele : [max, ele].max
  end

  def find_min(ele)
    empty? ? ele : [min, ele].min
  end

end


class MinMaxStackQueue
  attr_reader :instack, :outstack

  def initialize
    @instack = MinMaxStack.new
    @outstack = MinMaxStack.new
  end

  def enqueue(ele)
    @instack.push(ele)
  end

  def dequeue
    if @outstack.empty?
      until @instack.empty?
        @outstack.push(@instack.pop.keys[0])
      end
        @outstack.pop
    else
      @outstack.pop
    end
  end

  def size
    @instack.size + @outstack.size
  end

  def max
    return @instack.max if @outstack.empty?
    return @outstack.max if @instack.empty?
    [@instack.max, @outstack.max].max
  end

  def min
    return @instack.min if @outstack.empty?
    return @outstack.min if @instack.empty?
    [@instack.min, @outstack.min].min
  end

end

class MyStack
  def initialize(store = [])
    @store = store
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end

  def size
    @store.size
  end
end
