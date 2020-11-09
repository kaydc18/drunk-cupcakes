import React, { useState, useEffect } from 'react'

import SearchIngredient from './SearchIngredient'
import SearchName from './SearchName'
import RecipeTile from './RecipeTile'

export const SearchIndex = () => {
  const [getRecipe, setRecipe] = useState([])

  useEffect(() => {
    fetch("api/v1/recipes#index")
      .then(response => {
        if (response.ok) {
          return response
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage)
          throw error
        }
      })
      .then(response => response.json())
      .then(body => {
        setRecipe(body);
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])
  
  const recipeTileArray = getRecipe.map((recipe) => {
    return(
      <RecipeTile
        name={recipe.drink_name}
        drink_id={recipe.drink_id}
        id={recipe.id}
        key={recipe.id}
      />
    )
  })

  return(
    <div className="grid-container">
      <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y align-middle align-center">
        <div className="cell medium-6">
          <SearchIngredient />
        </div>
        <div className="cell medium-6">
          <SearchName />
        </div>
        <div className="cell medium-12">
          <div className="callout-purple align-middle">
            {recipeTileArray}
          </div>
        </div>
      </div>
    </div>
  )
}

export default SearchIndex