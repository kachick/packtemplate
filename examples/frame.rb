# coding: us-ascii

$VERBOSE = true

require_relative '../lib/packtemplate'

template = PackTemplate.build do
  unsigned_char :infinite
  uint16_t
  ber_compressed_int 5
end

p template
puts '-' * 78

summary = PackTemplate.summarize(template)
puts summary
puts '-' * 78

p PackTemplate.for_summary(summary)