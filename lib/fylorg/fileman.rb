# frozen_string_literal: true

require "fileutils"
require "pry"

module Fylorg
  class Fileman
    def load_files_for_processing(opts)
      files = String(opts[:types]).split(",").reduce([]) do |acc, filetype|
        acc + Dir[File.join(root_dir(opts), "**", "*.#{filetype}")]
      end

      [files, opts]
    end

    def relocate!(categorized_files, opts)
      categorized_files.map do |category, files|
      end

      category_path = File.join(ROOT_PATH, category.to_s)
      FileUtils.mkdir(category_path) unless File.exists?(category_path)
      find_books(category).map do |book_path|
        unless File.realdirpath(File.dirname(book_path)) == File.realdirpath(category_path)
          FileUtils.mv(book_path, category_path) 
        end
      end
      FileUtils.mkdir(ROOT_PATH) unless File.exists?(ROOT_PATH)
    end

    private 

    def dest_dir
    end

    def root_dir(opts)
      opts[:root] || "**" 
    end
  end
end
