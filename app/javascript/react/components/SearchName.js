import React from 'react'

export const SearchName = (props) => {
  return(
    <div className="callout-purple">
      <h2 className="text-center">Search By Ingredient</h2>
      <form>
        <label>Alcohol
          <select>
            <option value="husker">Vodka</option>
            <option value="starbuck">Gin</option>
            <option value="hotdog">Rum</option>
            <option value="apollo">Tequila</option>
          </select>
        </label>
      </form>
    </div>

  )
}

export default SearchName