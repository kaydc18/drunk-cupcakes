import React from 'react'
import { Link } from 'react-router-dom'

const RecipeTile = props =>  {
  return(
    <Link to={`recipe/${props.id}`}>
      <div className="drink-item text-center">
        <img src={props.drinkImage}/>
        <h5 className="drinks">{props.name}</h5>
      </div>
    </Link>
  )
}

export default RecipeTile