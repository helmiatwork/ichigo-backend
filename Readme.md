# Recipe

Recipe is a simple Ruby class that allows you to define and manage recipes. It provides a convenient way to store recipe information, including the name, ingredients, and method steps.

## How to execute
1. Install rspec gem on your local ruby. `gem install rspec`
2. execute the spec `rspec recipe_spec.rb`

## Usage

To use the Recipe class, follow these steps:

1. Require the `recipe.rb` file in your Ruby script:

   ```ruby
   require_relative 'recipe'

2. Define your recipes using the Recipe.recipe method and a block. Within the block, you can specify the recipe's name, ingredients, and method steps:

    ```
    Recipe.recipe 'Pancake' do
    ingredient 'Store-bought pancake mix'
    ingredient 'Water'

      method do
        step 'Mix the ingredients'
        step 'Cook them in a pan'
      end
    end

    ```
3. Access the recipe information using the Recipe.for method, passing the recipe's name as an argument:

    ```
    pancake_recipe = Recipe.for('Pancake')
    puts pancake_recipe.name
    puts pancake_recipe.ingredients
    puts pancake_recipe.method_steps

    ```

4. Output

    ```
    Pancake
    ["Store-bought pancake mix", "Water"]
    ["Mix the ingredients", "Cook them in a pan"]

    ```

5. You can also clear all the defined recipes using the Recipe.clear method:

    ```
    Recipe.clear

    ```

## Example

    ```
    require_relative 'recipe'

    # Define recipes
    Recipe.recipe 'Pancake' do
      ingredient 'Store-bought pancake mix'
      ingredient 'Water'

      method do
        step 'Mix the ingredients'
        step 'Cook them in a pan'
      end
    end

    # Access recipe information
    pancake_recipe = Recipe.for('Pancake')
    puts pancake_recipe.name
    puts pancake_recipe.ingredients
    puts pancake_recipe.method_steps

    ```
