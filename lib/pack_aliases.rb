# Copyright (c) 2013 Kenichi Kamiya

require 'optionalargument'

module PackAliases

  # @return [Class]
  OptArg = OptionAlargument.define do
    opt :C, aliases: [:'8bit_unsigned', :unsigned_char]
    opt :S, aliases: [:'16bit_unsigned', :uint16_t]
  end

  ALIASES = {
    '8bit_unsigned': :C,
    unsigned_char:   :C,
    '8bit_unsigned': :C,
    unsigned_char:   :C,
    '8bit_unsigned': :C,
    unsigned_char:   :C,
  }.freeze

  class << self

    # @param aliased [Symbol, String, #to_sym]
    # @param length [Integer, :infinite, nil]
    # @return [String]
    def template_for(aliased, length)
      length = length_for length
      suffix = suffix_for length
      origin = origin_for aliased.to_sym

      "#{origin}#{suffix}"
    end

    private

    # @param aliased [Symbol]
    def origin_for(aliased)
      ALIASES.fetch aliased
    end

    # @param length [Integer, :infinite, nil]
    def length_for(length)
      if length.respond_to?(:to_sym)
        length = length.to_sym
      end

      case length
      when Integer, :infinite
        length
      when nil
        :infinite
      else
        raise ArgumentError
      end
    end

    # @param length [Integer, :infinite, nil]
    def suffix_for(length)
      length == :infinite ? :'*' : length
    end

  end

end


class Array
  # @param aliased [Symbol, String, #to_sym]
  # @param length [Integer, :infinite, nil]
  def pack_alias(aliased, length=1)
    template = PackAliases.template_for aliased, length
    pack template
  end
end


class String
  # @param aliased [Symbol, String, #to_sym]
  # @param length [Integer, :infinite, nil]
  def unpack_alias(aliased, length=1)
    template = PackAliases.template_for aliased, length
    unpack template
  end
end