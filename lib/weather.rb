class Weather


  def initialize
    @sunshine = nil

  end

  def sunshine

    @sunshine = rand(1..6) == 1 ? false : true

  end

end
