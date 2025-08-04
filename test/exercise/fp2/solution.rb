module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        element = first
        yield element

        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(acc = MyArray.new, index = 0, &block)
        return acc if index >= size

        my_map(acc.push(yield(self[index])), index + 1, &block)
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, element|
          acc.push(element) unless element.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        element = first
        new_acc = acc.nil? ? element : yield(acc, element)
        MyArray.new(self[1..]).my_reduce(new_acc, &block)
      end
    end
  end
end
