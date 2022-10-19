require_relative 'lib/database_connection'
require_relative 'lib/recipe_repo'
require_relative 'lib/recipe'

DatabaseConnection.connect('recipes_directory')

repo = RecipeRepository.new
recipes = repo.all
puts recipes[0].recipe_name
puts recipes[1].recipe_name
puts recipes[2].recipe_name
