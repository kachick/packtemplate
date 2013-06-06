packtemplate
===========

[![Build Status](https://secure.travis-ci.org/kachick/packtemplate.png)](http://travis-ci.org/kachick/packtemplate)
[![Gem Version](https://badge.fury.io/rb/packtemplate.png)](http://badge.fury.io/rb/packtemplate)

Description
-----------

DSL to build "Pack Template Format(for Array#pack, String#unpack)"

Features
--------

* Builder
* Parser
* Pure Ruby :)

Usage
-----

```ruby
require 'packtemplate'

template = PackTemplate.build do
  unsigned_char :infinite
  uint16_t
  ber_compressed_int 5
end

p template     #=> "C*S1w5"

summary = PackTemplate.summarize(template)
puts summary #=> unsigned_char :infinite
                 uint16_t 1
                 ber_compressed_int 5

p PackTemplate.for_summary(summary) #=> "C*S1w5"
```

Requirements
-------------

* Ruby - [1.9.3 or later](http://travis-ci.org/#!/kachick/packtemplate)

Install
-------

```bash
gem install packtemplate
```

Link
----

* [Home](http://kachick.github.com/packtemplate/)
* [code](https://github.com/kachick/packtemplate)
* [API](http://kachick.github.com/packtemplate/yard/frames.html)
* [issues](https://github.com/kachick/packtemplate/issues)
* [CI](http://travis-ci.org/#!/kachick/packtemplate)
* [gem](https://rubygems.org/gems/packtemplate)

License
--------

The MIT X11 License  
Copyright (c) 2013 Kenichi Kamiya  
See MIT-LICENSE for further details.