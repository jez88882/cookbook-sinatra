class Recipe
  attr_reader :name, :description, :rating

  def initialize(name, description, rating, done = "false", prep_time)
    @name = name
    @description = description
    @rating = rating
    @done = done == "true"
    @prep_time = prep_time
  end

  def done?
    @done == true
  end

  def done!
    @done = true
  end

end
