import React from 'react'
import { Link } from 'react-router-dom'

import crunkcake from '../../../assets/images/crunkcake.png'

export const Home = (props) => {
  return(
    <div className="grid-container">
      <div className="align-self-middle">
        <div className="grid-x grid-padding-x grid-padding-y grid-margin-x align-middle align-center">
          <div className="cell medium-4 text-center">
            <img src={crunkcake}/>
          </div>
          <div className="cell auto callout-purple">
            <h1>Welcome to Drunk Cupcakes!</h1>
            <h3>Now you can eat your booze! Just search for a drink or ingredient of choice and receive a cupcake recipe of that drink!</h3>
            <div className="grid-x align-center align-bottom">
              <div className="cell medium-6">
               <Link to="/search"><div className="fun-button">Search</div></Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> 
  )
}

export default Home