import React, { useState, useEffect } from 'react'
import RecipeInfoTile from './RecipeInfoTile'


const RecipeShow = props => {
  const [newRecipe, setNewRecipe] = useState({})

  const id = props.match.params.id

  useEffect(() => {
    fetch(`/api/v1/recipes/${id}`)
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

console.log(newRecipe.ingredient)
return (
  <div className="grid-container">
    <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y">
      <div className="cell large-12">
        <h1>{newRecipe.recipe} Cupcakes</h1>
      </div>
   </div>
  </div>
  )
}


export default RecipeShow