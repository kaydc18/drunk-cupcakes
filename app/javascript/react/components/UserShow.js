import React, { useState, useEffect } from 'react'

import RecipeBookList from './RecipeBookList'

const UserShow = (props) => {

  const [getUser, setUser] = useState({})

  const id = props.match.params.id

  useEffect(() => {
    fetch(`/api/v1/users/${id}`, {
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
      setUser(responseBody);  
    })
  .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])



  return(
    <div className="grid-container">
      <div className="grid-x">
        <h1>Hello {getUser.first_name}!</h1>
        <RecipeBookList info={id}/>
      </div>
    </div>
  )
}

export default UserShow