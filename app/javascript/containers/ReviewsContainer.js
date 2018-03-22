import React, { Component } from 'react';
import ReviewTile from '../components/ReviewTile';
import ReviewFormContainer from './ReviewFormContainer';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: [],
      userVotes: []
    }
    this.addNewReview = this.addNewReview.bind(this);
    this.getReviewData = this.getReviewData.bind(this);
    this.vote = this.vote.bind(this);
    this.upVote = this.upVote.bind(this);
    this.downVote = this.downVote.bind(this);
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
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => window.location.href=window.location.href)
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount(){
    this.getReviewData()
  }

  getReviewData() {
    let id = this.props.id
    fetch(`/api/v1/trips/${id}/reviews`, {
      credentials: 'same-origin',
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
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        reviews: body.reviews,
        userVotes: body.userVotes
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  upVote(reviewId) {
    let newVote ={
      vote:  {
        value: 2,
        review_id: reviewId,
        trip_id: this.props.id
      }
    }
    this.vote(newVote)
  }

  downVote(reviewId) {
    let newVote = {
      vote: {
        value: 0,
        review_id: reviewId,
        trip_id: this.props.id
      }
    }
    this.vote(newVote)
  }

  vote(vote){
    fetch(`/api/v1/trips/${this.props.id}/reviews/${vote.vote.review_id}/votes`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(vote),
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
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        reviews: body['reviews'],
        userVotes: body['userVotes']
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let reviews = this.state.reviews.map(review => {
      let votecount = 0
      if (review.votes) {
        review.votes.forEach((vote) => {
          votecount += (vote.value - 1)
        })
      }

      let userVote
      this.state.userVotes.forEach((vote) => {
        if (vote.review_id == review.review.id) {
          userVote = vote
        }
      })

      let upVote = () => { this.upVote(review.review.id) }
      let downVote = () => { this.downVote(review.review.id) }
      let deleteReview = () => { this.deleteReview(review.review.id) }
      return(
        <ReviewTile
          key={review.review.id}
          id={review.review.id}
          avatar={review.avatar}
          date={review.review.updated_at}
          body={review.review.body}
          rating={review.review.rating}
          creator={review.display_name}
          upVote={upVote}
          downVote={downVote}
          userVotes={this.state.userVotes}
          score={votecount}
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
