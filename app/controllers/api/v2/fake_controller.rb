class Api::V2::FakeController < Api::V2::BaseController

  def fast
  end

  def normal
    sleep 1.5
  end

  def slow
    sleep 3
  end

end

