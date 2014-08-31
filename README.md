# Hold Please

Because ActiveRecord callbacks are a bad idea. They're way too easy to misuse and should probably be removed from Rails altogether. But, as some Rails core team members in favor of the removal have pointed out, that will probably never happen.

But that's no reason not to protect yourself and your loved ones.

```ruby
class User < ActiveRecord::Base

  before_create do
    # Bad stuff
  end

end
```

```
>> User.create!
HoldPlease::NoCallbacks: You really shouldn't use ActiveRecord callbacks
```

## Installation

Add the gem to your Gemfile.

```ruby
gem "hold_please"
```

## Usage

You don't have to do anything—just don't use ActiveRecord callbacks. If someone does, an exception will be raised letting them know they've done a bad thing. Callbacks used from within gems will continue to work as normal—an exception will only be raised if a callback is used from inside the app.

It should work on Rails versions 3.0.0 and up.

## Credits

Lots of love to [Gary Bernhardt](https://www.destroyallsoftware.com) and his gem  [Do Not Want](https://github.com/garybernhardt/do_not_want) for giving me the idea.

Also infinite thanks to [Avand](http://avandamiri.com), as always, for brainstorming the perfect name with me and myriad other things.

## Contributing

1. Fork it ( http://github.com/brandonweiss/hold_please/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
