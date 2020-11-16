import React from 'react'

const SearchError = (props) => {

  return(
    <div className="cell medium-6 large-6 text-center">
      <h3>{props.searchError}</h3>
    </div>
  )
}

export default SearchError