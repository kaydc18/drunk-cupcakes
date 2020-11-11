import React, { useState, useEffect } from 'react'

import RecipeFrostingTile from './RecipeFrostingTile'
import RecipeBatterTile from './RecipeBatterTile'


const RecipeBookShow = (props) => {
  const [newRecipe, setNewRecipe] = useState({})
  
  const id = props.match.params.id

  useEffect(() => {
    fetch(`/api/v1/recipe_books/${id}`)
    .then(response => {
      if (response.ok) {
        return response
      } else {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(responseBody => {
      setNewRecipe(responseBody);  
    })
  .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  let frostingInfo 
  if (newRecipe.alcohol) {
   frostingInfo = <RecipeFrostingTile alcohol={newRecipe.alcohol} />
  } 

  let batterInfo 
  if (newRecipe.ingredient) {
   batterInfo = <RecipeBatterTile ingredient={newRecipe.ingredient} />
  } 

  return(  
    <div className="grid-container">
    <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y">
      <div className="cell large-12">
        <h1 className="text-center">{newRecipe.recipe} Cupcakes</h1>
        {frostingInfo}
        {batterInfo}
      </div>
    </div>
  </div>
)

}

export default RecipeBookShow