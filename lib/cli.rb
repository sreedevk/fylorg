# frozen_string_literal: true

module Fylorg
  require_relative "fylorg"

  class Cli
    def initialize(args)
      @args = parse args
    end

    def run!
      Fylorg::Base.new(@args).organize!
    end

    private

    def parse(raw_args)
      Hash[raw_args.map { |arg| arg.gsub('--', '').split('=') }]
    end
  end
end
