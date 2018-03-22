import React, {Component} from 'react';
import TripTile from '../components/TripTile';
import TripFormContainer from './TripFormContainer';

class TripsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentPage: 1,
      tripsPerPage: 5,
      trips: [],
    }    
    this.handleClick = this.handleClick.bind(this);
  }
  
  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
  }
  
  handleBodyChange(event) {
    this.setState({body: event.target.value})
  }
    
  componentWillReceiveProps(nextProps){
    if (nextProps.selectedCategoryId != this.props.selectedCategoryId){
      this.setState({ currentPage: 1})
    }
  }
    
  componentDidMount() {
    fetch('/api/v1/trips').then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json()).then(body => {
      this.setState({trips: body.trips});
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }  
  
  render() {      
    let selectedCategory = this.props.selectedCategoryId    
    let trips = this.state.trips
    let tripsPerPage = this.state.tripsPerPage
    let currentPage = this.state.currentPage        
    let filteredTrips = this.state.trips.map(trip => {
      if (trip.categories != undefined) {
        var isPresent = trip.categories.some(function(element) {
          return element.id == selectedCategory
        });
      }
      if (selectedCategory == null) {
        return (        
          trip
        )
      } else if (isPresent == true) {
        return (
          trip
        )
      }
    }).filter(x => x)    
    
    // Logic for displaying trips
    let indexOfLastTrip = currentPage * tripsPerPage;
    let indexOfFirstTrip= indexOfLastTrip - tripsPerPage;
    let currentTrips = filteredTrips.slice(indexOfFirstTrip, indexOfLastTrip);             
         
    
    let renderTrips = currentTrips.map(trip => {
      return (
          <TripTile 
            key={trip.id}
            id={trip.id}
            name={trip.name}
            description={trip.description}
          />
        )      
    })
  
  // Logic for displaying page numbers
  let pageNumbers = [];
  for (let i = 1; i <= Math.ceil(filteredTrips.length / tripsPerPage); i++) {
    pageNumbers.push(i);
  }
  
  let renderPageNumbers = pageNumbers.map(number => {
    return (
      <li
        key={number}
        className="page-item"
        >
          <a className="page-link" key={number} id={number} onClick={this.handleClick}>{number}</a>
        </li>
      );
    });
    
    return (
      <div>             
        {renderTrips}
        <nav aria-label="Page navigation example">
          <ul className="pagination">
            {renderPageNumbers}
          </ul>        
        </nav>
        
      </div>
    )
  }
}

export default TripsContainer;