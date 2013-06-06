# coding: us-ascii
# Copyright (c) 2013 Kenichi Kamiya

require_relative 'packtemplate/aliases'
require_relative 'packtemplate/builder'
require_relative 'packtemplate/singleton_class'


template = PackTemplate.build do
  unsigned_char :infinite
  uint16_t
  ber_compressed_int 5
end

p template
summary = PackTemplate.summarize(template)
puts summary
p PackTemplate.for_summary(summary)