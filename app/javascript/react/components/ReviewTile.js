import React from 'react'

const ReviewTile = (props) => {
  
  return( 
    <div className="callout-purple">
      <div className="grid-x">
        <div className="large-6 cell">
          <h2>{props.user}</h2>
        </div>
        <div className="large-6 cell">
          <h2>{props.recipe}</h2>
        </div>
        <div className="large-12 cell">
          <p>Rating: {props.rating}</p>
        </div>
        <div className="large-12 cell">
          <p>What did you think about this recipe?</p>
          <p>{props.thoughts}</p>
        </div>
        <div className="large-12 cell">
          <p>How would you change this recipe?</p>
          <p>{props.edits}</p>
        </div>
      </div>
    </div>
  )
}

export default ReviewTile