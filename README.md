pack_aliases
===========

[![Build Status](https://secure.travis-ci.org/kachick/pack_aliases.png)](http://travis-ci.org/kachick/pack_aliases)
[![Gem Version](https://badge.fury.io/rb/pack_aliases.png)](http://badge.fury.io/rb/pack_aliases)

Description
-----------

A trying DbC in Ruby.
But so hack, I use for debug :)

Features
--------

* Pure Ruby :)

Usage
-----

```ruby
require 'module/dbc'

class FooBar
  extend Module::DbC

  def initialize
    @counter = 1
  end

  def func(arg)
    @counter += 1
    arg + 1
  end

  dbc :func,
       pre: ->arg{arg > 1},
       post: ->ret{ret >= 10},
       invariant: ->{@counter < 3}
end

FooBar.new.func 0 #=> fail pre-conditon is invalid: (args: 0) (Module::DbC::PreConditionError)
FooBar.new.func 8 #=> fail post-conditon is invalid: (ret: 9) (Module::DbC::PostConditionError)
FooBar.new.func 9 #=> pass

foo = FooBar.new
foo.func 11       #=> pass
foo.func 11       #=> fail invariant-conditon is invalid (Module::DbC::PostInvariantConditionError)
```

Requirements
-------------

* Ruby - [1.9.2 or later](http://travis-ci.org/#!/kachick/pack_aliases)

Install
-------

```bash
gem install pack_aliases
```

Link
----

* [Home](http://kachick.github.com/pack_aliases/)
* [code](https://github.com/kachick/pack_aliases)
* [API](http://kachick.github.com/pack_aliases/yard/frames.html)
* [issues](https://github.com/kachick/pack_aliases/issues)
* [CI](http://travis-ci.org/#!/kachick/pack_aliases)
* [gem](https://rubygems.org/gems/pack_aliases)

License
--------

The MIT X11 License  
Copyright (c) 2013 Kenichi Kamiya  
See MIT-LICENSE for further details.