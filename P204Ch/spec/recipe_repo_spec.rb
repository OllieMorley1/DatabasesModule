require 'recipe_repo'

  def reset_recipes_table
    seed_sql = File.read('spec/recipes_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

RSpec.describe RecipeRepository do

        before(:each) do 
          reset_recipes_table
        end

    it 'returns all recipes' do
        repo = RecipeRepository.new
        recipes = repo.all
        expect(recipes[0].cooking_time).to eq '10'
        expect(recipes[2].recipe_name).to eq 'Sandwich'
        expect(recipes[1].rating).to eq '4'
    end

    it 'returns individual recipe' do
        repo = RecipeRepository.new
        recipe = repo.find(1)
        expect(recipe.id).to eq '1'
        expect(recipe.recipe_name).to eq 'Pizza'
        expect(recipe.rating).to eq '5'
    end
end