module QppTest
  class WordHelper
    class << self
      def tally(text)
        tally_result = {}
        extract_words(text).each do |word| 
          key = word.downcase.to_sym
          tally_result[key] = tally_result[key].to_i + 1
        end
        tally_result
      end

      def filter(phrase, blacklist)
        filtered_phrase = phrase.dup

        extract_blacklisted_words(phrase, blacklist).each do |word|
          mask_text = "*" * word.length
          filtered_phrase.gsub!(word,mask_text)
        end

        filtered_phrase
      end

      private

      def extract_blacklisted_words(phrase, blacklist)
        extract_words(phrase).map do |word|
          word if blacklist.include? word.downcase
        end.compact
      end

      def extract_words(text)
        text.split(" ").map(&:strip)
      end
    end
  end
end