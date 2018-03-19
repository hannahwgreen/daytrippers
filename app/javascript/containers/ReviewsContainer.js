import React, { Component } from 'react';
import ReviewTile from '../components/ReviewTile';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
  }
  
  componentDidMount() {
    let id = this.props.id
    fetch(`/api/v1/reviews/${id}`)
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
      console.log(this.state.reviews);
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  

      render() {
      let reviews = this.state.reviews.map(review => {
        return(
          <ReviewTile
            key={review.id}
            user={review.id}
            body={review.body}
            rating={review.rating}
            creator={review.user}
          />
        )
        })

        return(
          <div>
            {reviews}
          </div>
        )
      }
    }
    
    export default ReviewsContainer;