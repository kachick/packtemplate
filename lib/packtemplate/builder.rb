# coding: us-ascii

module PackTemplate

  class Builder

    attr_reader :result

    def initialize
      @result = ''
    end

    private

    # @param aliased [Symbol, String, #to_sym]
    # @param length [Integer, :infinite, nil]
    # @return [String]
    def template_for(aliased, length)
      length = length_for length
      suffix = suffix_for length
      origin = origin_for aliased.to_sym

      "#{origin}#{suffix}"
    end

    # @param aliased [Symbol]
    def origin_for(aliased)
      ALIASES.fetch aliased
    end

    # @param length [Integer, :infinite, nil]
    def length_for(length)
      if length.respond_to? :to_sym
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

    ALIASES.each_pair do |aliased, origin|
      define_method aliased do |length=1|
        @result << template_for(aliased, length)
      end
    end

  end

  private_constant :Builder

end