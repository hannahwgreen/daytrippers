import React, { Component } from 'react';
import CategoriesContainer from './CategoriesContainer';
import TripsContainer from './TripsContainer';

class HomeContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedCategoryId: null
    }
    this.handleCategoryChange = this.handleCategoryChange.bind(this)
  }
  
  handleCategoryChange(id) {
    if (id === this.state.selectedCategoryId) {
      this.setState({selectedCategoryId: null})
    } else {
      this.setState({selectedCategoryId: id})
    }
  }
  
  render() {
    
    return(
      <div>
        <CategoriesContainer 
          onChange={this.handleCategoryChange}
          selectedCategoryId={this.state.selectedCategoryId} />
        <TripsContainer />
      </div>
    )
  }
}

export default HomeContainer;