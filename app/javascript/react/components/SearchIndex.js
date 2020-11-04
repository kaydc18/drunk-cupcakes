import React, {Fragment} from 'react'

import SearchIngredient from './SearchIngredient'

export const SearchIndex = (props) => {
  return(
  <Fragment>
    <div className="container">
      <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y align-middle align-center">
        <div className="cell medium-12 large-4">
          <SearchIngredient />
        </div>
      </div>
    </div>
  </Fragment>
  )
}

export default SearchIndex