import React, { Component } from 'react'

class SearchName extends Component {
  constructor(props) {
    super(props);
    this.state = {
      recipes: [],
      searchString: ''
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    const newSearchString = event.target.value
    this.setState({ searchString: newSearchString })
  }

  handleSubmit(event) {
    event.preventDefault()
    const body = JSON.stringify({
      search_string: this.state.searchString
    })
    fetch('/api/v1/recipes/name_search.json', {
      method: 'POST',
      body: body,
      credentials: 'same-origin',
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({ recipes: body })
    })
  }

  render() {
    return(
      <div className="callout-purple">
        <h2 className="text-center">Search By Cocktail Name</h2>
        <form onSubmit={this.handleSubmit}>
        <label>Enter Drink Name
            <input type="text" name='searchString' value={this.state.searchString} onChange={this.handleChange} placeholder="Margarita" />
          </label>
          <input type="submit" className="button" value="Search by Name" />
        </form>
      </div>

    )
  }
  
}

export default SearchName