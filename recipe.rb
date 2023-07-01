class Recipe
  attr_reader :name, :ingredients, :method_steps

  @@recipes = Array.new

  def initialize(name)
    @name = name
    @ingredients = Array.new
    @method_steps = Array.new
    @@recipes << self #keeps track of all the recipe instance created
  end

  def self.recipe(name, &block)
    recipe = self.new(name)
    recipe.instance_eval(&block)
  end

  def ingredient(name)
    @ingredients << name
  end

  def step(step_description)
    @method_steps << step_description
  end

  def self.clear
    @@recipes.clear
  end

  def self.for(name)
    @@recipes.find{|receipt| receipt.name == name}
  end

  def self.recipe_names
    @@recipes.map(&:name) #get all stored recipe names
  end

  def self.describe(&block)
    instance_eval(&block) #execute provided block of code
  end

  def method(&block)
    instance_eval(&block) #execute provided block of code
  end
end
