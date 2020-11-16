import React from 'react'

const ReviewTile = (props) => {
  
  return( 
    <div className="callout-purple">
      <h1>{props.rating}</h1>
      <p>{props.thoughts}</p>
      <p>{props.edits}</p>
    </div>
  )
}

export default ReviewTile