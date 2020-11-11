import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom' 

import RecipeFrostingTile from './RecipeFrostingTile'
import RecipeBatterTile from './RecipeBatterTile'
import HandlingInfoTile from './HandlingInfoTile'

const RecipeShow = props => {
 
  const [newRecipe, setNewRecipe] = useState({})
  const [recipeSave, setRecipeSave] = useState({})
  const [errorList, setErrorList] = useState({})

  const id = props.match.params.id

  useEffect(() => {
    fetch(`/api/v1/recipes/${id}`, {
      credentials: "same-origin"
    })
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

  const handleSave = () => {
    const body = JSON.stringify({
      recipe: `${id}`
    })
    fetch(`/api/v1/recipes/${id}/recipe_books`, {
      method: 'POST',
      body: body,
      credentials: 'same-origin',
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
    })
      .then(response => {
        if (response.ok) {
          return response
        } else {
          const errorMessage = `${response.status} (${response.statusText})`;
          const error = new Error(errorMessage);
          throw (error);
        }
      })
      .then(response => response.json())
      .then(responseBody => {
        if (responseBody.info) {
          setErrorList(responseBody)
        } else {
          setRecipeSave(responseBody);
          setErrorList(responseBody.info)
        }

      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  let saveInfo
  if (errorList) {
    saveInfo = <HandlingInfoTile info={errorList.info} user={errorList.user} />
  }

return (
  <div className="grid-container">
    <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y">
      <div className="cell large-12">
        <h1 className="text-center">{newRecipe.recipe} Cupcakes</h1>
        {frostingInfo}
        {batterInfo}
        <div className="grid-x align-center align-middle grid-margin-x grid-margin-y grid-padding-x grid-padding-y">
          <div className="cell medium-6 large-6">
            <div className="fun-button" onClick={handleSave}>Save Recipe</div>
          </div>
        </div>
        <div className="grid-x align-center align-middle grid-margin-x grid-margin-y grid-padding-x grid-padding-y"> 
          {saveInfo}
        </div>
      </div>
   </div>
  </div>
  )
}


export default RecipeShow