import React, {Fragment} from 'react'

import cupcake from '../../../assets/images/cupcake.png'
import SearchIndex from './SearchIndex'

export const Home = (props) => {
  return(
  <Fragment>
    <div className="container">
      <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y align-middle align-center">
        <div className="cell medium-2">
        <img src={cupcake}/>
        </div>
        <div className="cell medium-4">
          <div className="callout-purple">
            <h1>Welcome to DrunkCupcakes!</h1>
            <h3>Now you can eat your booze! Just search for a drink or ingredient of choice and receive a cupcake recipe of that drink!</h3>
          </div>
        </div>
      </div>
    </div>
    <div className="container">
      <div className="grid-x grid-margin-x grid-margin-y grid-padding-x grid-padding-y align-middle align-center">
        <div className="cell medium-4">
          <SearchIndex />
        </div>
      </div>
    </div>
  </Fragment>
  )
}

export default Home