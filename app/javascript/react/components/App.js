import React from 'react'
import { Route, Switch, BrowserRouter } from 'react-router-dom'

import Home from './Home'
import SearchIndex from './SearchIndex'
import RecipeShow from './RecipeShow'


export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={Home}/>
        <Route exact path="/search" component={SearchIndex}/>
        <Route exact path="/recipe/:id" component={RecipeShow}/>
      </Switch> 
  </BrowserRouter>
  )
}

export default App
