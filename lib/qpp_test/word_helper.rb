require "cgi"

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

      def filter(text, blacklist)
        filtered_text = text.dup

        extract_blacklisted_words(text, blacklist).each do |word|
          mask_text = "*" * word.length
          filtered_text.gsub!(word,mask_text)
        end

        filtered_text
      end

      def link_to_users(text, domain)
        updated_text = text.dup
        extract_user_tags(text).each do |tag|
          user_link = create_user_tag_link(tag,domain)
          updated_text.gsub!(tag,user_link)
        end
        updated_text
      end

      private

      def create_user_tag_link(tag,domain)
        tag = CGI.escapeHTML(tag)
        "<a href='http://github.com/#{tag[1..-1]}'>#{tag}</a>"
      end

      def extract_blacklisted_words(text, blacklist)
        extract_words(text).map do |word|
          word if blacklist.include? word.downcase
        end.compact
      end

      def extract_user_tags(text)
        extract_words(text).select do |word|
          word[0] == "@"
        end.uniq
      end

      def extract_words(text)
        text.split(" ").map(&:strip)
      end
    end
  end
end