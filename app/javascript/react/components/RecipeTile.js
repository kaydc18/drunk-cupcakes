import React from 'react'
import { Link } from 'react-router-dom'

const RecipeTile = props => (
    <ul>
      <Link to={`recipe/${props.id}`}><li>{props.name}</li></Link>
    </ul>
)

export default RecipeTile