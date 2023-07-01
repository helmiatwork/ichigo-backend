require_relative 'recipe'

describe Recipe do
  before do
    described_class.clear
  end

  it 'checks if the class is empty after clearing' do
    recipes = described_class.instance_variable_get(:@recipes)
    expect(recipes).to be_nil
  end

  context "given completed methods and ingredients" do
    before do
      described_class.describe do
        recipe 'Pancake' do
          ingredient 'Store-bought pancake mix'
          ingredient 'Water'

          method do
            step 'Mix the ingredients'
            step 'Cook them in a pan'
          end
        end

        recipe 'Miso Soup' do
          ingredient 'Tofu'
          ingredient 'White miso paste'

          method do
            step 'Mix miso paste into boiling water'
            step 'Add tofu and serve'
          end
        end
      end
    end

    it 'records the ingredients and method of each recipe' do
      pancake_recipe = described_class.for('Pancake')

      expect(pancake_recipe.name).to eq 'Pancake'
      expect(pancake_recipe.ingredients).to eq ['Store-bought pancake mix', 'Water']
      expect(pancake_recipe.method_steps).to eq ['Mix the ingredients', 'Cook them in a pan']

      soup_recipe = described_class.for('Miso Soup')

      expect(soup_recipe.name).to eq 'Miso Soup'
      expect(soup_recipe.ingredients).to eq ['Tofu', 'White miso paste']
      expect(soup_recipe.method_steps).to eq ['Mix miso paste into boiling water', 'Add tofu and serve']

      #make sure if the class save every recipe
      recipe_names = described_class.recipe_names
      expect(recipe_names).to contain_exactly('Pancake', 'Miso Soup')
    end
  end

  context "given non-described recipe" do
    it 'returns nil' do
      noodle_recipe = described_class.for("Noodle")
      expect(noodle_recipe).to be_nil
    end
  end

  context "given recipe without ingredients" do
    before do
      described_class.describe do
        recipe "Melted mozzarella" do
          method do
            step "Put mozzarella in oven"
            step "Turn the temperature to 150 degrees"
            step "Wait for 2-3 minutes"
          end
        end
      end
    end

    it 'can handle recipe without ingredients' do
      melted_mozzarella_recipe = described_class.for("Melted mozzarella")
      expect(melted_mozzarella_recipe.name).to eq "Melted mozzarella"
      expect(melted_mozzarella_recipe.ingredients).to be_empty
      expect(melted_mozzarella_recipe.method_steps).to eq ["Put mozzarella in oven", "Turn the temperature to 150 degrees", "Wait for 2-3 minutes"]
    end
  end

  context "given recipe without method steps" do
    before do
      described_class.describe do
        recipe "Sugar candy" do
          ingredient "Sugar"
          ingredient "Water"
        end
      end
    end

    it "can handle recipe without method steps" do
      sugar_candy_recipe = described_class.for("Sugar candy")
      expect(sugar_candy_recipe.name).to eq "Sugar candy"
      expect(sugar_candy_recipe.ingredients).to eq ["Sugar", "Water"]
      expect(sugar_candy_recipe.method_steps).to be_empty
    end
  end
end

