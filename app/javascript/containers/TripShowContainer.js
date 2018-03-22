import React, { Component } from 'react';
import TripShow from '../components/TripShow';
import ReviewsContainer from './ReviewsContainer';

class TripShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      trip: {},
    }
  }
  
  componentDidMount() {
    let id = this.props.params.id
    fetch(`/api/v1/trips/${id}`)
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
      this.setState({
        trip: body.trip
      });      
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  
  render() {    
    let trip_id = this.state.trip.id
    let trip_name = this.state.trip.name
    let trip_description = this.state.trip.description
    let trip_image = this.state.trip.image_url

    return(
      <div>
        <TripShow
          key={trip_id}
          id={trip_id}
          name={trip_name}
          image={trip_image}
          description={trip_description}
        />
        <ReviewsContainer
          id={this.props.params.id}
        />
      </div>
    )
  }
}

export default TripShowContainer;