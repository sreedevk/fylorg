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
        category_path = File.join(opts[:out], category.to_s)
        FileUtils.mkdir(category_path) unless File.exists?(category_path)
        files.map do |categorized_file|
          unless File.realdirpath(File.dirname(categorized_file)) == File.realdirpath(category_path)
            FileUtils.mv(categorized_file, category_path) 
          end
        end
      end
    end

    private 

    def root_dir(opts)
      opts[:root] || "**" 
    end
  end
end
