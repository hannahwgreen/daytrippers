import React, { Component } from 'react';
import CategoriesContainer from './CategoriesContainer';
import TripsContainer from './TripsContainer';
import { Link } from 'react-router';

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
        <div className="row align-items-center mb-3">
          <div className="col"><h3 className="mb-0">Trips</h3></div>
          <div className="col"><Link to={`/trips/new`}><button type="button" className="btn btn-success float-right">Add trip</button></Link></div>
        </div>
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