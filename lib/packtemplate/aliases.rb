# coding: us-ascii

# @todo
# * Consider aliased name
# * Fix indent

module PackTemplate

  ALIASES = {
    unsigned_char:   :C,
    uint16_t:        :S,
    uint32_t:        :L,
    uint64_t:        :Q,

    singend_char:    :c,
    int16_t:        :s,
    int32_t:        :l,
    int64_t:        :q,

    unsigned_short:    :S!,
    unsigned_int:    :I!,
    unsigned_long:    :L!,
    unsigned_long_long:    :Q!,

    signed_short:    :s!,
    signed_int:    :i!,
    signed_long:    :l!,
    signed_long_long:    :q!,

    uint16_t_big_endian:    :n,
    uint32_t_big_endian:    :N,
    uint16_t_little_endian:    :v,
    uint32_t_little_endian:    :V,

    utf8:    :U,
    ber_compressed_int:    :w,

    double_precision: :D,
    single_precision: :F,
    double_precision_little_endian: :E,
    single_precision_little_endian: :e,
    double_precision_big_endian: :G,
    single_precision_big_endian: :g,

    arbitrary_binary_string_space_padded: :A,
    arbitrary_binary_string_null_padded: :a, # Try squash with `Z` in DSL
    arbitrary_binary_string_null_padded_contain_infinite: :Z, # So ugly :(
    bit_string_msb_first: :B,
    bit_string_lsb_first: :b,
    hex_string_high_nibble_first: :H,
    hex_string_low_nibble_first: :h,
    bit_string_msb_first: :B,
    bit_string_lsb_first: :b,
    hex_string_high_nibble_first: :H,
    hex_string_low_nibble_first: :h,
    uu_encoded: :u,
    mime: :M,
    base64: :m,
    structure: :P,
    null_terminated_string: :P,

    absolute_position: :'@',
    back_up_a_byte: :X,
    null_byte: :x
  }.freeze

end