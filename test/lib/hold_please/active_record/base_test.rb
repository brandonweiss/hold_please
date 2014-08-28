require File.expand_path("../../../../test_helper", __FILE__)
require File.expand_path("../../../../gems/fake_gem", __FILE__)

describe ActiveRecord::Base do

  before do
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
  end

  it "raises an exception if a callback is defined" do
    ActiveRecord::Base.connection.create_table(:foobar)

    ActiveRecord::Callbacks::CALLBACKS.each do |callback|
      model = Class.new(ActiveRecord::Base) do
        self.table_name = "foobar"

        self.send(callback) { "Bad things" }
      end

      type, event = callback.to_s.split("_")

      exception = lambda {
        model.new.run_callbacks(event)
      }.must_raise HoldPlease::NoCallbacks
      exception.message.must_equal "You really shouldn't use ActiveRecord callbacks"
    end
  end

  it "does not raise an exception if a callback is used from a gem" do
    ActiveRecord::Base.connection.create_table(:fake_gem)

    lambda {
      FakeGem.new.run_callbacks(:save)
    }.must_be_silent
  end

  it "passes through arguments to the original callback definition method" do
    ActiveRecord::Base.connection.create_table(:fake_gem)

    fake_gem = FakeGem.new
    fake_gem.expects(:callbacks_are_evil?)
    fake_gem.run_callbacks(:validation)
  end

end
