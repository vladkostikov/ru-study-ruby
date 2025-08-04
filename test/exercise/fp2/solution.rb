module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(index = 0, &block)
        return self if index >= size

        yield self[index]
        my_each(index + 1, &block)
      end

      # Написать свою функцию my_map
      def my_map(acc = MyArray.new, index = 0, &block)
        return acc if index >= size

        my_map(acc.push(yield(self[index])), index + 1, &block)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |element| result << element unless element.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, index = 0, &block)
        return acc if index >= size

        if acc.nil?
          acc = first
          index = 1
        end

        my_reduce(yield(acc, self[index]), index + 1, &block)
      end
    end
  end
end
