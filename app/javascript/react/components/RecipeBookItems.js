import React from 'react'
import { Link } from 'react-router-dom'

const RecipeBookItems = (props) => {

  return(
    <Link to={`recipe_book/${props.link}`}>
      <div className="drink-item text-center">
        <img src={props.image}/>
        <h5 className="drinks">{props.name}</h5>
      </div>
  </Link>
  )
}

export default RecipeBookItems