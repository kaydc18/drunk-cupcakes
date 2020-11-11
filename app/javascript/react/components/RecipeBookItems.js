import React from 'react'
import { Link } from 'react-router-dom'

const RecipeBookItems = (props) => {

  
  return(
    <ul>
      <Link to={`recipe_book/${props.link}`}><li className="drinks">{props.name}</li></Link>
    </ul>
  )
}

export default RecipeBookItems