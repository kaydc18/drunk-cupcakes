import React, { useState } from 'react'

const ReviewForm = (props) => {
  const [newReview, setNewReview] = useState({
    rating: "",
    thoughts: "",
    suggested_edits: ""
  })

  let err
  const handleInputChange = event => {
    if (event.currentTarget.name === "rating") {
      if (event.currentTarget.value != "" && !Number(event.currentTarget.value)) {
        err = <h3>Your rating must be a number</h3>
      }
    }
    setNewReview({
      ...newReview,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const onSubmitHandler = () => {
    props.handleReview(newReview)
  }


  return(

    <div className="grid-x grid-padding-x grid-padding-y callout-purple">
      <div className="cell large-12 text-center">
        <h1>Review Form</h1>
      </div>

       <form onSubmit={onSubmitHandler}>
         {err}
       <div className="grid-container">
        <div className="grid-x grid-padding-x">
         <div className="cell large-12">
          <label>
            How would you rate this recipe (1-5)?
            <input type="number"  min="1"
        max="5" name="rating" onChange={handleInputChange} />
          </label>
         </div>


        <div className="cell large-12">
          <label>
            What are your thoughts on this recipe?
            <textarea type="text" name="thoughts" onChange={handleInputChange} placeholder="Enter text here" />
          </label>
        </div>

        <div className="cell large-12">
         <label>
           How would you change this recipe?
           <textarea type="text" name="suggested_edits" onChange={handleInputChange} placeholder="Enter text here" />
         </label>
         </div>

         <div className="cell large-12">
         <input className="button" type="submit" value="Submit" />
         </div>
         </div>
         </div>
       </form>
     </div>

 
  )

}

export default ReviewForm