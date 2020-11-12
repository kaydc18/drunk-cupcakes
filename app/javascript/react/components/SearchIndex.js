import React, { useState, useEffect } from 'react'

import SearchName from './SearchName'
import RecipeTile from './RecipeTile'

export const SearchIndex = () => {
  const [getRecipe, setRecipe] = useState([])
  const [errorList, setErrorList] = useState({})

  const handleNameSubmit = (searchNameQuery) => {
    const body = JSON.stringify({
      search_string: `${searchNameQuery.trim()}`
    })
    fetch("/api/v1/recipes/name_search.json", {
      method: 'POST',
      body: body,
      credentials: 'same-origin',
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
    })
      .then(response => {
        if (response.ok) {
          return response
        } else {
          setErrorList({info: "this recip doesn't exist, please try another"})
          const errorMessage = `${response.status} (${response.statusText})`;
          const error = new Error(errorMessage);
          throw (error);
        }
      })
      .then(response => response.json())
      .then(responseBody => {
        setRecipe(responseBody);
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  let errorInfo
  if (errorList) {
    errorInfo = <h3>{errorList.info}</h3> 
  }


  useEffect(() => {
    fetch("api/v1/recipes", {
      credentials: "same-origin"
    })
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
        <div className="cell large-12 text-center">
          {errorInfo}
          <SearchName handleNameSubmit={handleNameSubmit} />
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