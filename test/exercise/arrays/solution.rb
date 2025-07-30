module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.first

        array.each do |value|
          max_value = value if value > max_value
        end

        array.map do |value|
          value.positive? ? max_value : value
        end
      end

      def search(_array, _query)
        0
      end
    end
  end
end
