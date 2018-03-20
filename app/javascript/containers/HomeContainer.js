import React, { Component } from 'react';
import CategoriesContainer from './CategoriesContainer';
import TripsContainer from './TripsContainer';

class HomeContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedCategoryId: null,
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
      <div className="container mt-5">
        <h3>Trips</h3>
        <CategoriesContainer 
          onCategoryChange={this.handleCategoryChange}
          selectedCategoryId={this.state.selectedCategoryId} />       
        <TripsContainer
          selectedCategoryId={this.state.selectedCategoryId} />
        </div>
        )
      }
    }
    
    export default HomeContainer;