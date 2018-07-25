require './lib/recipe'
require "pry"

class Pantry
         attr_reader  :stock,
                      :stock_check,
                      :add_to_shopping_list,
                      :shopping_list
    def initialize
      @stock = {}
      @stock_check = 0
      @shopping_list = {}
      @test_hash = {}
    end

    def stock_check(item)
      @stock_check
    end
    
    def restock(item, ammount)
      @stock_check += ammount
    end

    def add_to_shopping_list(recipe)
       list = recipe.ingredients
       @shopping_list = @shopping_list.merge(list)
     
    end

    # patron.interests.sum do |interest|
    #     @exhibits[interest]
end
