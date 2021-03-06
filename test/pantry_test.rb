require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
    def test_it_exists
      pantry = Pantry.new

      assert_instance_of Pantry, pantry
    end

    def test_it_holds_stoc
      pantry = Pantry.new
      expected = {}
      assert_equal expected, pantry.stock
    end

    def test_stock_check
      pantry = Pantry.new
      assert_equal 0, pantry.stock_check("Cheese")
    end

    def test_restock
      pantry = Pantry.new 
      pantry.restock("Cheese", 10)
      pantry.restock("Cheese", 20)
      assert_equal 30, pantry.stock_check("Cheese")
    end

    def test_add_to_shopping_list
      r = Recipe.new("Cheese Pizza")
      r.add_ingredient("Flour", 20) 
      r.add_ingredient("Cheese", 20)

      pantry = Pantry.new
      pantry.add_to_shopping_list(r)
      expected = {"Cheese" => 20, "Flour" => 20}
      assert_equal expected, pantry.shopping_list
    end

    def test_it_can_add_another_recipe
      r = Recipe.new("Cheese Pizza")
      r.add_ingredient("Flour", 20) 
      r.add_ingredient("Cheese", 20)

      pantry = Pantry.new
      pantry.add_to_shopping_list(r)

      r = Recipe.new("Spaghetti")
      r.add_ingredient("Spaghetti Noodles", 10)
      r.add_ingredient("Marinara Sauce", 10)
      r.add_ingredient("Cheese", 5)
      pantry.add_to_shopping_list(r)
     
     expected = {"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10}
     assert_equal expected, pantry.shopping_list
    end
     
    def test_it_prints_shopping_list
      r = Recipe.new("Cheese Pizza")
      r.add_ingredient("Flour", 20) 
      r.add_ingredient("Cheese", 20)

      pantry = Pantry.new
      pantry.add_to_shopping_list(r)

      r = Recipe.new("Spaghetti")
      r.add_ingredient("Spaghetti Noodles", 10)
      r.add_ingredient("Marinara Sauce", 10)
      r.add_ingredient("Cheese", 5)
      pantry.add_to_shopping_list(r)
      
      expected = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"
      assert expected, pantry.print_shopping_list
      
    end
    
end
