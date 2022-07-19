require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'instance methods' do 
    it "#total_cost" do 
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      meatballs = Ingredient.create!(name: "Meatballs,", cost: 10)
      pasta = Ingredient.create!(name: "Pasta", cost: 5)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meatballs.id)
      
      expect("#{spaghetti.total_cost}").to eq("15")
    end
  end
end
