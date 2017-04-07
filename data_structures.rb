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

class MyStack

  def initialize
    @store = []
    @max = MinMaxStackQueue.new()
    @mix = MinMaxStackQueue.new()
  end

  def pop
    @store.pop
    peek.values.each { |val|
  end

  def push(ele)
    newhash = Hash.new
    newnhash[ele] = [min(ele),max(ele)]
    @store.push(newhash)
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

  def max(ele)
    @max = ele if @max.nil?
    @max = ele if ele > @max
    @max
  end

  def min
    @min = ele if @min.nil?
    @min = ele if ele > @min
    @max
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

class MinMaxStackQueue

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

  def max
    @enstack.max
  end

  def min
    @enstack.min
  end

end
