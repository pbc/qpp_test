module QppTest
  class WordHelper
    class << self
      def tally(text_sample)
        tally_result = {}
        text_sample.split(" ").map(&:strip).each do |word| 
          key = word.downcase.to_sym
          tally_result[key] = tally_result[key].to_i + 1
        end
        tally_result
      end
    end
  end
end