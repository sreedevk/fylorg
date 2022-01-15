# frozen_string_literal: true

module Fylorg
  require_relative "confparser"
  require "levenshtein"

  class Matcher
    MATCH_THRESHOLD  = 0.99
    MATCH_FILT_LEVEL = 0.1

    def categorize(files, opts)
      [
        generate_matches(files, opts).inject({}) { |mem, data| mem.merge(data) },
        opts
      ]
    end

    private

    def generate_matches(files, opts)
      Fylorg::Confparser.new.parse(opts).map do |category, keywords|
        match_for_category(files, category, keywords)
      end
    end

    def match_for_category(files, category, keywords)
      {
        category => files.select do |file|
          keywords_match?(
            file.scan(/[a-zA-Z0-9]+/).select { |file_meta_word| file_meta_word.length >= 2 },
            keywords
          )
        end
      }
    end

    def keywords_match?(file_words, category_words)
      Float(
        Levenshtein.normalized_distance(
          file_words, category_words, MATCH_THRESHOLD
        )
      ) > MATCH_FILT_LEVEL
    end
  end
end
