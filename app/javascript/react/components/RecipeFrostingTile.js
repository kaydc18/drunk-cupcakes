import React from 'react'

const RecipeFrostingTile = (props) => {
 
const alcoholArray = props.alcohol.map((ingredient) => {

  let newIngredient = ingredient.split(",")

    return(
  
        <li key={ingredient}>{newIngredient[0]} Tablespoons {newIngredient[1]}</li>
 
    
    )
  })

  return(
    <div className="callout-purple">
      <h3>Frosting Ingredients</h3>
      <ul>
        <li>1/2 cup unsalted butter, softened</li>
        <li>2 cups confectioners' sugar, sifted</li>
            {alcoholArray}
        <li>3 drops food coloring, or as needed (Optional)</li>
      </ul>
      <h3>Frosting Instructions</h3>
      <ul>
        <li>Cream room temperature butter with a hand mixer, the paddle attachment of a stand mixer, or a wooden spoon until smooth and fluffy.</li>
        <li>Gradually beat in confectioners' sugar until fully incorporated. Beat in vanilla extract.</li>
        <li>Pour in liquids and beat for an additional 3 to 4 minutes.If it's not soft enough, add more liquid.</li>
        <li>Add food coloring, if using, and beat for thirty seconds until smooth or until desired color is reached.</li>
      </ul>
    </div>

  )
}

export default RecipeFrostingTile