import React from 'react'

export const SearchIndex = (props) => {
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
        <label>Favorite Mixer
          <select>
            <option value="husker">Orange Juice</option>
            <option value="starbuck">Cranberry Juice</option>
            <option value="hotdog">Grenadine</option>
            <option value="apollo">Lime Juice</option>
          </select>
        </label>
      </form>
    </div>

  )
}

export default SearchIndex