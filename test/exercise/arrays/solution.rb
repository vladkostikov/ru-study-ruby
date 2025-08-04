module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = find_max(array)
        array.map do |value|
          value.positive? ? max_value : value
        end
      end

      def search(array, query)
        b_search(array, query, 0, array.size - 1)
      end

      private

      def b_search(array, query, start_i, end_i)
        return -1 if start_i > end_i

        middle_i = (start_i + end_i) / 2
        return middle_i if array[middle_i] == query

        start_i = middle_i + 1 if array[middle_i] < query
        end_i = middle_i - 1 if array[middle_i] > query
        b_search(array, query, start_i, end_i)
      end

      def find_max(array)
        max_value = array.first
        array.each do |value|
          max_value = value if value > max_value
        end
        max_value
      end
    end
  end
end
