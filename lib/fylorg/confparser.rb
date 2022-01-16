# frozen_string_literal: true

require "json"

module Fylorg
  class Confparser
    def parse(opts)
      JSON.parse(File.open(opts[:dictionary], "r", &:read))
    end
  end
end
