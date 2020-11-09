import React from 'react'

export const SearchName = (props) => {
  return(
    <div className="callout-purple">
      <h2 className="text-center">Search By Cocktail Name</h2>
      <form>
      <label>Enter Drink Name
          <input type="text" placeholder="Margarita" />
        </label>
      </form>
    </div>

  )
}

export default SearchName