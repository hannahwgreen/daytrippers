import React, { Component } from 'react';
import ReviewTile from '../components/ReviewTile';
import ReviewFormContainer from './ReviewFormContainer';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
    this.addNewReview = this.addNewReview.bind(this);
  }
  
  addNewReview(submission) {
    let id = this.props.id
    fetch(`/api/v1/trips/${id}/reviews`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(submission),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
        debugger
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => window.location.href=window.location.href)
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  
  componentDidMount() {
    let id = this.props.id
    fetch(`/api/v1/trips/${id}/reviews`)
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
        reviews: body.reviews
      });            
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  
  render() {
    let reviews = this.state.reviews.map(review => {
      return(
        <ReviewTile
          key={review.id}
          avatar={review.user.avatar.thumb.url}
          date={review.updated_at}
          body={review.body}
          rating={review.rating}
          creator={review.user.display_name}
        />
      )
    })
    
    return(
      <div className="container">
        <ul className="list-unstyled">
          {reviews}
        </ul>
        <ReviewFormContainer
          addNewReview={this.addNewReview}
          id={this.props.id} />
        </div>
      )
    }
  }
  
  export default ReviewsContainer;