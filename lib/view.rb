class View
  def ask_for_name
    puts "Recipe name:"
    gets.chomp
  end

  def ask_for_description
    puts "Description:"
    gets.chomp
  end

  def ask_for_rating
    puts "Rating:"
    gets.chomp
  end

  def ask_for_index
    puts "which one"
    gets.chomp.to_i - 1
  end

  def ask_for_prep
    puts "Prep time:"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{recipe.done? ? 'X' : ' '}]#{recipe.name}: #{recipe.description} #{recipe.prep_time} (#{recipe.rating}/5)"
    end
  end

  def ask_for_keyword
    puts "keyword pleaseee"
    gets.chomp
  end

  def display_results(results)
    results.each_with_index do |recipe, idx|
      puts "#{idx+1}: #{recipe[0]}"
    end
  end

  def importing(chosen)
    puts "importing #{chosen}... "
  end
end
