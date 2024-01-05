module Enumerable
  def my_each_with_index
    for index in (0...self.length)
      element = self[index]
      yield(element, index)
    end
    self
  end

  def my_select
    arr = []
    self.each do |elem|
      arr << elem if yield(elem) == true
    end
    arr
  end

  def my_all?
    state = nil
    self.each do |elem|
      if yield(elem) == true
        state = true
      elsif yield(elem) == false
        state = false
      end
    end
    state
  end
end


class Array
  def my_each
    for element in self
      yield(element)
    end
  end
end
