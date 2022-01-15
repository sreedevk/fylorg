# frozen_string_literal: true

module Fylorg
  require_relative "fylorg/confparser"
  require_relative "fylorg/matcher"
  require_relative "fylorg/fileman"

  class Base
    attr_accessor :opts

    def initialize(raw_opts)
      @opts = raw_opts.slice(*%w[dictionary out root types])
    end

    def organize!
      Fylorg::Fileman.new.relocate!(
        *Fylorg::Matcher.new.categorize(
          *Fylorg::Fileman.new.load_files_for_processing(opts)
        )
      )
    end
  end
end

__END__

  def move_books(category)
end

pp BookOrganizer.new.move_books(:microservice)
