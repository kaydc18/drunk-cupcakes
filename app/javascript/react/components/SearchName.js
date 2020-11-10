import React, { useState } from 'react'

const SearchName = props => {
  const [searchNameQuery, setSearchNameQuery] = useState("");

  const handleInputChange = event => {
    event.preventDefault();
    const value = event.currentTarget.value;
    setSearchNameQuery(value);
  }


    return(
      <div className="callout-purple">
        <h2 className="text-center">Search By Cocktail Name</h2>
        <form onSubmit={event => props.handleNameSubmit(event, searchNameQuery)}>
        <label>Enter Drink Name
            <input onChange={handleInputChange} type="text" placeholder="Margarita" />
          </label>
          <input type="submit" className="button" value="Search" />
        </form>
      </div>
    )
}

export default SearchName