import React from 'react'
import { Link } from 'react-router-dom'

const HandlingInfoTile = (props) => {
  return(
    <div className="cell medium-6 large-6 text-center">
      <h3>{props.info}</h3>
      <Link to={`/users/${props.user}`}><div className="fun-button">View Saved Recipes</div></Link>
    </div>
  )
}

export default HandlingInfoTile