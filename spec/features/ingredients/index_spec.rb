require 'rails_helper'

RSpec.describe 'ingredients index page' do 
   it 'has a list of ingredients and the number of recipes each ingredient is used in' do 
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      tikka = Recipe.create!(name: "Chicken Tikka", complexity: 3, genre: "Indian")

      chicken = Ingredient.create!(name: "Chicken")
      pasta = Ingredient.create!(name: "Pasta")
      snails = Ingredient.create!(name: "Snails")
      meatballs = Ingredient.create!(name: "Meatballs")

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: tikka.id, ingredient_id: chicken.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: chicken.id)

      visit '/ingredients'

      within "#ingredients-#{chicken.id}" do 
         expect(page).to have_content("Chicken: 2")
      end

      within "#ingredients-#{pasta.id}" do 
         expect(page).to have_content("Pasta: 1")
      end

      within "#ingredients-#{snails.id}" do 
         expect(page).to have_content("Snails: 0")
      end
   end
end



# User Story 3 of 4
# As a visitor,
# When I visit '/ingredients'
# I see a list of ingredients and the number of recipes each ingredient is used in.
# (e.g. "Ground Beef: 2"
#      "Salt: 4")