import React, { Component } from 'react';
import ReviewTextAreaField from '../components/ReviewTextAreaField';
import {browserHistory} from 'react-router';

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      body: '',
      rating: '',
      errors: {}
    }
    
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.validateBody = this.validateBody.bind(this);
    this.validateRating = this.validateRating.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  
  handleBodyChange(event) {
    this.setState({body: event.target.value})
  }
  
  handleRatingChange(event) {
    this.setState({rating: event.target.value})
  }
  
  validateBody(body) {
    if (body === '' || body === ' ') {
      let newError = { body: 'Review may not be blank.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.body
      this.setState({ errors: errorState })
      return true
    }
  }
  
  validateRating(rating) {
    if (rating === '' || rating === ' ') {
      let newError = { rating: 'Rating may not be blank.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.rating
      this.setState({ errors: errorState })
      return true
    }
  }
  
  handleClear(event) {
    event.preventDefault();
    this.setState({body: '', rating: ''})
  }
  
  handleSubmit(event) {
    event.preventDefault();
    if (
      this.validateBody(this.state.body) &&
      this.validateRating(this.state.rating)
    )
    {
      let formPayload = {
        body: this.state.body,
        rating: this.state.rating
      }
      
      this.props.addNewReview(formPayload)
      this.handleClear(event);
    }
  }
  
  render() {
    let errorDiv;
    let errorItems;
    if (Object.keys(this.state.errors).length > 0) {
      errorItems = Object.values(this.state.errors).map(error => {
        return(<li key={error}>{error}</li>)
      })
      errorDiv = <div className="callout alert">{errorItems}</div>
    }
    
    return(      
      <form className="new-review-form callout mb-5" onSubmit={this.handleSubmit}>
        <h3>Add review for this trip</h3>
        {errorDiv}
        <ReviewTextAreaField
          content={this.state.body}
          label="Review"
          name="review"
          handlerFunction={this.handleBodyChange}
        />
        <div className="form-group">
          <label className="mr-3">Rating</label>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="rating" id="inlineRadio1" value="1" onChange={this.handleRatingChange} />
            <label className="form-check-label" for="inlineRadio1">1</label>
          </div>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="rating" id="inlineRadio2" value="2" onChange={this.handleRatingChange} />
            <label className="form-check-label" for="inlineRadio2">2</label>
          </div>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="rating" id="inlineRadio3" value="3" onChange={this.handleRatingChange} />
            <label className="form-check-label" for="inlineRadio3">3</label>
          </div>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="rating" id="inlineRadio4" value="4" onChange={this.handleRatingChange} />
            <label className="form-check-label" for="inlineRadio3">4</label>
          </div>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="rating" id="inlineRadio5" value="5" onChange={this.handleRatingChange} />
            <label className="form-check-label" for="inlineRadio3">5</label>
          </div>
        </div>
        
        
        
        <div className="button-group">
          <button className="btn btn-primary" type="submit" value="Submit">Submit</button>
        </div>
      </form>
    )
  }
}

export default ReviewFormContainer;