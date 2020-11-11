import React, { useState } from 'react'

export const SearchIngredient = (props) => {
  const [searchIngredientsQuery, setSearchIngredientsQuery] = useState({});

  const handleInputChange = event => {
    event.preventDefault();
    setSearchIngredientsQuery({
      ...searchIngredientsQuery,
      [event.currentTarget.name]: event.currentTarget.value
    });
  }


  return(
    <div className="callout-purple">
      <h2 className="text-center">Search By Ingredient</h2>
      <form>
        <label>Alcohol
          <select onChange={handleInputChange} name="alcohol">
            <option value="default">Select from the following:</option>
            <option value="vodka">Vodka</option>
            <option value="gin">Gin</option>
            <option value="rum">Rum</option>
            <option value="tequila">Tequila</option>
          </select>
        </label>
        <label>Favorite Mixer
          <input type="text" name="mixer" onChange={handleInputChange} placeholder="Orange Juice" />
        </label>
        <input type="submit" className="button" value="Search" />
      </form>
    </div>

  )
}

export default SearchIngredient