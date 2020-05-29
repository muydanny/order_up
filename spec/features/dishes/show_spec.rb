require 'rails_helper'

RSpec.describe "When I visit a dish's show page" do
  before(:each) do
    @chef = Chef.create(name: "Chef Sam")
    @sandwich  = @chef.dishes.create(name: "BLT", description: "Delicious and hand made") 

    @lettuce = Ingredient.create(name:"Lettuce", calories: 20)
    @tomato = Ingredient.create(name:"Tomato", calories: 50)
    @bacon = Ingredient.create(name:"Bacon", calories: 150)

    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @lettuce.id)
    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @tomato.id)
    DishIngredient.create(dish_id: @sandwich.id, ingredient_id: @bacon.id)
  end

  it "I see a list of ingredients for that dish and the chef's name" do
    visit "/dishes/#{@sandwich.id}"

    expect(page).to have_content(@sandwich.name)
    expect(page).to have_content(@lettuce.name)
    expect(page).to have_content(@tomato.name)
    expect(page).to have_content(@bacon.name)
    expect(page).to have_content("Created by: #{@chef.name}")
  end
end

# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name