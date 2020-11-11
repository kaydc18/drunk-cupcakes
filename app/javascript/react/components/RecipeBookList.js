import React, { useState, useEffect } from 'react'

import RecipeBookItems from './RecipeBookItems'

const RecipeBookList = (props) => {
  const [recipeBook, setRecipeBook] = useState([])

  useEffect(() => {
    fetch(`/api/v1/users/${props.info}/recipe_books`, {
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
      setRecipeBook(responseBody);  
    })
  .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  const recipeBookArray = recipeBook.map((recipe) => {
    return(<RecipeBookItems key={recipe.id} name={recipe.name} link={recipe.id} />)
  })

  return(
    <div className="cell large-12">
        {recipeBookArray}
    </div>
  )
}

export default RecipeBookList