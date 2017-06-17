require 'json'
require 'open-uri'

module Expenses
  class ConversionError < StandardError; end

  class Converter
    # @api private
    def self.currency_rates
      @currency_rates ||= Hash.new do |hash, key|
        hash[key] = self.get_currency_rates_for(key)
      end
    end

    # @api private
    def self.get_currency_rates_for(currency)
      open("http://api.fixer.io/latest?base=#{currency}") do |stream|
        return JSON.parse(stream.read)['rates']
      end
    end

    attr_reader :base_currency
    def initialize(base_currency)
      @base_currency = base_currency
    end

    def convert(dest_currency, amount)
      currency_rates[dest_currency] * amount
    rescue SocketError => error
      raise ConversionError.new(error)
    end

    private
    def currency_rates
      self.class.currency_rates[@base_currency]
    end
  end
end
