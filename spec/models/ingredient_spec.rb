require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    # it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'model methods' do 
    it '#recipe_count' do 
      meatballs = Ingredient.create!(name: "Meatballs")
      pasta = Ingredient.create!(name: "Pasta")
      chicken = Ingredient.create!(name: "Chicken")

      tikka = Recipe.create!(name: "Chicken Tikka", complexity: 3, genre: "Indian")
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: tikka.id, ingredient_id: chicken.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: chicken.id)

      

      expect(chicken.recipe_count).to eq(2)
    end
  end
end
