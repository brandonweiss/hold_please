require "hold_please/version"
require "hold_please/active_record/base"

module HoldPlease

  class NoCallbacks < StandardError

    def to_s
      "You really shouldn't use ActiveRecord callbacks"
    end

  end

  def self.caller_is_probably_within_a_gem?(caller)
    /\/gems\//.match(caller[0])
  end

end
