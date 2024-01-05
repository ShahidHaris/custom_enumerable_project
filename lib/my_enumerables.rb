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

  def my_any?
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

  def my_none?
    self.each do |elem|
      if !yield(elem)
        return true
      elsif yield(elem)
        return false
      end
    end
  end

  def my_count
    enum_size = []
    self.each do |elem|
      if block_given?
        enum_size << elem if yield(elem) == true
      else
        return self.size
      end
    end
    enum_size.size
  end

  def my_map
    map_array = []
    self.each do |elem|
      map_array << yield(elem) if block_given?
    end
    map_array
  end

  def my_inject(acc)
    result = acc
    self.each do |elem|
      result = yield(result, elem)
    end
    result
  end



end


class Array
  def my_each
    for element in self
      yield(element)
    end
  end
end
