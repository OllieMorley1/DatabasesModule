require_relative './recipe'
class RecipeRepository

    def all
        #returns all recipes
        #SQL: SELECT * FROM recipes;
        sql = 'SELECT * FROM recipes;'
        result = DatabaseConnection.exec_params(sql, [])
        recipes = []

        result.each do |x|
            recipe = Recipe.new
            recipe.id = x['id']
            recipe.recipe_name = x['recipe_name']
            recipe.cooking_time = x['cooking_time']
            recipe.rating = x['rating']
            recipes << recipe
        end
        return recipes
    end

    def find(id)
        #returns individual recipe
        #SQL: SELECT * FROM recipes WHERE id = $1;
        sql = 'SELECT * FROM recipes WHERE id = $1;'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)

        recipe = Recipe.new
        x = result[0]
        recipe.id = x['id']
        recipe.recipe_name = x['recipe_name']
        recipe.cooking_time = x['cooking_time']
        recipe.rating = x['rating']

        return recipe
        
    end
end


#repo = RecipeRepository.new
#recipes = repo.all
#recipes[0].cooking_time => 10
#recipes[2].recipe_name => 'Sandwich'
#recipes[1].rating => 4


#repo = RecipeRepository.new
#recipe = repo.find(1)
#recipe.id => 1
#recipe.recipe_name => 'Pizza'
#recipe.rating => 5
