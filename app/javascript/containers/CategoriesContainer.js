import React, { Component } from 'react';
import CategoryTile from '../components/CategoryTile';

class CategoriesContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: [],
    }
  }
  
  componentDidMount() {
    fetch('/api/v1/categories')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({ categories: body });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
    
  render() {
    let className;
    let categories = this.state.categories.map(category => {
      
      if(category.id === this.props.selectedCategoryId){
        className = "nav-link active"        
      } else {
        className = "nav-link"
      }
      
      let handleClick = () => {
        this.props.onCategoryChange(category.id)
        console.log(category.id);
      }
      
      return(
        <CategoryTile
          key={category.id}
          id={category.id}
          name={category.name}
          handleClick={handleClick}
          className={className}
        />
      )
    })
    
    return(
      <div>
        <ul className="nav nav-pills nav-fill bg-light text-dark">
          {categories}
        </ul>
      </div>
    )
  }
}

export default CategoriesContainer;