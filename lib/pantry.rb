require './lib/recipe'
require "pry"

class Pantry
         attr_reader  :stock,
                      :stock_check,
                      :add_to_shopping_list,
                      :shopping_list
    def initialize
      @stock = Hash.new(0)
      @shopping_list = {}
    end

    def stock_check(item)
      @stock[item]
    end
    
    def restock(item, ammount)
      @stock[item] += ammount
    end

    def add_to_shopping_list(recipe)
       list = recipe.ingredients
       @shopping_list = @shopping_list.merge(list) do |key, oldval, newval|
        oldval + newval
       end 
    end
   
    def print_shopping_list
        @shopping_list.inject("") do |printed_list, pair| 
            printed_list += "*#{pair.join(": ")}\n"
        end 
    end
    # patron.interests.sum do |interest|
    #     @exhibits[interest]
end
