require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class RecipeTest < Minitest::Test
  def test_pantry_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end
  
  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20) # 500 "UNIVERSAL UNITS"
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 20)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
  end

  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20)
    assert_equal 20, r.amount_required("Flour")
  end

  def test_it_can_hold_ingredients
    r = Recipe.new("Cheese Pizza")
    expected = {}
    assert_equal expected, r.ingredients
  end
end
