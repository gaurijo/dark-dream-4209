require 'rails_helper'

RSpec.describe 'recipes index page' do 
   it 'has a list of recipes with name, complexity, and genre' do 
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      tikka = Recipe.create!(name: "Chicken Tikka", complexity: 3, genre: "Indian")
      escargot = Recipe.create!(name: "Escargot", complexity: 4, genre: "French")

      visit '/recipes'

      within "#recipes-#{spaghetti.id}" do 
         expect(page).to have_content("Name: Spaghetti")
         expect(page).to have_content("Complexity: 2")
         expect(page).to have_content("Genre: Italian")
      end
      within "#recipes-#{tikka.id}" do 
         expect(page).to have_content("Name: Chicken Tikka")
         expect(page).to have_content("Complexity: 3")
         expect(page).to have_content("Genre: Indian")
      end
      within "#recipes-#{escargot.id}" do 
         expect(page).to have_content("Name: Escargot")
         expect(page).to have_content("Complexity: 4")
         expect(page).to have_content("Genre: French")
      end 
   end
end

# User Story 1 of 4
# As a visitor,
# When I visit '/recipes',
# I see a list of recipes with the following information:
# -Name
# -Complexity
# -Genre
# (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")