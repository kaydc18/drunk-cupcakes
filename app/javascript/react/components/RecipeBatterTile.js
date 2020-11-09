import React from 'react'

const RecipeBatterTile = (props) => {
 
const ingredientsArray = props.ingredient.map((ingredient) => {

  let newIngredient = ingredient.split(",")

    return(<li key={ingredient}>{newIngredient[0]}</li>)
  })

  return(
    <div className="callout-purple">
      <h3>Batter Ingredients</h3>
      <ul>
        <li>1 box of classic white cake mix</li>
            {ingredientsArray}
      </ul>
      <h3>Batter Instructions</h3>
      <ul>
        <li>Follow box instructions except replace water with liquids listed above</li>
      </ul>
    </div>

  )
}

export default RecipeBatterTile