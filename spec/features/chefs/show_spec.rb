require 'rails_helper'

RSpec.describe "When I visit a chef's show page" do
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

  it "I see the name of that chefAnd I see a link to view a list of all ingredients" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)

    click_link("See all ingredients")
    expect(current_path).to eq("/chefs/:id/ingredients")

    expect(page).to have_content("A Unique List of Ingredients") 
    expect(page).to have_content(@lettuce.name)
    expect(page).to have_content(@tomato.name)
    expect(page).to have_content(@bacon.name)

  end
end

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all 
# ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the 
# ingredients that this chef uses