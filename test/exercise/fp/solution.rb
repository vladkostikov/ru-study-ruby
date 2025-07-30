# Отключил, чтобы rubocop не предлагал заменить reduce на each_with_object
# rubocop:disable Style/EachWithObject

module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        films_info = films.map do |film|
          {
            number_of_countries: film['country']&.split(',')&.size || 0,
            rating: film['rating_kinopoisk']&.to_f || 0
          }
        end

        ratings_of_filtered_films = films_info.reduce([]) do |memo, film|
          memo << film[:rating] if film[:number_of_countries] >= 2 && film[:rating].positive?
          memo
        end

        ratings_of_filtered_films.reduce(:+) / ratings_of_filtered_films.size.to_f
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end

# rubocop:enable Style/EachWithObject
