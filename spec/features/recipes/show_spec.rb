require 'rails_helper' 

RSpec.describe 'recipes show page' do 
   it 'has a list of the names of each of the ingredients' do 
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      tikka = Recipe.create!(name: "Chicken Tikka", complexity: 3, genre: "Indian")

      chicken = Ingredient.create!(name: "Chicken")
      pasta = Ingredient.create!(name: "Pasta")
      snails = Ingredient.create!(name: "Snails")
      meatballs = Ingredient.create!(name: "Meatballs")

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: tikka.id, ingredient_id: chicken.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)

      visit "/recipes/#{spaghetti.id}"

      expect(page).to have_content("Meatballs")
      expect(page).to have_content("Pasta")
      expect(page).to_not have_content("Snails")
   end

   it 'has a total cost of all of the ingredients in the recipe' do 
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")

      meatballs = Ingredient.create!(name: "Meatballs,", cost: 10)
      pasta = Ingredient.create!(name: "Pasta", cost: 5)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)

      visit "/recipes/#{spaghetti.id}"

      expect(page).to have_content("Total Cost: 15")

   end

end
# User Story 4 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")