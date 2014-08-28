class FakeGem < ActiveRecord::Base

  self.table_name = "fake_gem"

  before_save do
    "Bad stuff"
  end

  before_validation :do_bad_stuff, if: :callbacks_are_evil?

private

  def do_bad_stuff
    "Bad stuff"
  end

  def callbacks_are_evil?
    true
  end

end
