import React, { Component } from 'react';
import { Link } from 'react-router';

class Search extends Component {
  handleSearch(event) {
    this.props.searchTrips(search: event.target.value)
  }
  
  render() {
    return (
      <form className="form-inline my-2 my-lg-0" onSubmit={this.handleSearch.bind(this)}>
        <input className="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
        <button className="btn btn-light my-2 my-sm-0" type="submit">Search</button>
      </form> 
    )
  }
}

export default Search;