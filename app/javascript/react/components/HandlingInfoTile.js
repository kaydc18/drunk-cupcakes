import React from 'react'
import { Link } from 'react-router-dom'

const HandlingInfoTile = (props) => {

  let hideLink
  if (props.info === "you need to be logged in to save recipes") {
    hideLink
  } else if (props.info === "this has been added to your recipe book")  {
    hideLink = <h3>Click here to view saved recipes</h3>
  } else if (props.info === "this is in your recipe book already")  {
    hideLink = <h3>Click here to view saved recipes</h3>
  }

  return(
    <div className="cell medium-6 large-6 text-center">
      <h3>{props.info}</h3>
      <div className="cell medium-6 large-6 text-center">
      <Link to={`/users/${props.user}`}>{hideLink}</Link>
        </div>
    </div>
  )
}

export default HandlingInfoTile