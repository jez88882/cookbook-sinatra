require 'csv'
require_relative 'recipe'
require 'pry-byebug'

class Cookbook
  # initialize(csv_file_path) which loads existing Recipe from the CSV

  def initialize(csv_file_path)
    @recipes = []
    @file = csv_file_path
    csv_options = { col_sep: ',', quote_char: '"'}
    CSV.foreach(@file, csv_options) { |row| @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4]) }
  end

  # all which returns all the recipes
  def all
    @recipes
  end

  # add_recipe(recipe) which adds a new recipe to the cookbook
  def add_recipe(recipe)
    @recipes << recipe
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@file, 'wb', csv_options) do |csv|
      @recipes.each { |rec| csv << [rec.name, rec.description, rec.rating] }
    end
  end

  # remove_recipe(recipe_index) which removes a recipe from the cookbook.
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@file, 'wb', csv_options) do |csv|
      @recipes.each { |recipe| csv << recipe }
    end
  end
end
