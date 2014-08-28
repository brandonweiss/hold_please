require "active_record"

module ActiveRecord
  class Base

    class << self
      ActiveRecord::Callbacks::CALLBACKS.each do |callback|
        alias_method "hold_please_#{callback}", callback

        define_method callback do |*args|
          type, event = callback.to_s.split("_")

          if HoldPlease.caller_is_probably_within_a_gem?(caller)
            send "hold_please_#{callback}", *args
          else
            set_callback(event.to_sym, type.to_sym) do
              raise HoldPlease::NoCallbacks
            end
          end
        end
      end
    end

  end
end
