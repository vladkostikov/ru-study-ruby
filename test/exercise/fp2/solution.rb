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
      def my_map
        result = MyArray.new
        my_each { |element| result << yield(element) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |element| result << element unless element.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        skip_first_element = false
        if acc.nil?
          acc = first
          skip_first_element = true
        end

        my_each do |element|
          if skip_first_element
            skip_first_element = false
            next
          end

          acc = yield(acc, element)
        end

        acc
      end
    end
  end
end
