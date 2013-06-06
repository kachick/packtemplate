# coding: us-ascii

module PackTemplate

  class << self

    # DSL Scope
    # @return [String] template
    def build(&block)
      builder = Builder.new
      builder.instance_exec(&block)
      builder.result
    end

    # @param template [String]
    # @return [String] summary
    def summarize(template)
      ret = ''

      template.scan(/([a-zA-Z@][!<>]?)([0-9]+|\*)?/) do |dir, len|
        length = if len
                   len == '*' ? :infinite : Integer(len)
                 else
                   1
                 end

        aliased = ALIASES.key dir.to_sym

        ret << "#{aliased} #{length.inspect}\n"
      end

      ret
    end

    alias_method :dsl, :summarize

    # @param summary [String]
    # @return [String] template
    def for_summary(summary)
      build do
        summary.each_line do |line|
          dir, len = line.split
          length = len == ":infinite" ? :infinite : Integer(len)
          __send__ dir, length
        end
      end
    end

    alias_method :for_dsl, :for_summary

  end

end