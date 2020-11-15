class SortIngredient
  def inintialize
    

  end

  def ingredients_sort(drink)
    @ingredients = []
    drink.each do |key, item|
      if key.start_with?("strIngredient") && item != nil
        ingredient_number = key.delete("strIngredient")
        @ingredients << {"#{ingredient_number}": item}
      end
    end
    return @ingredients
  end

  def measurements_sort(drink)
    @measurements = []
    drink.each do |key, item|
      if key.start_with?("strMeasure")&& item != nil
          measurement_number = key.delete("strMeasure")
          @measurements << {"#{measurement_number}": item}
      end
    end

    while @measurements.length < @ingredients.length
      measurement_number = @measurements.length
      measurement_number += 1
      @measurements << {"#{measurement_number}": "none"}
    end
    return @measurements
  end
end