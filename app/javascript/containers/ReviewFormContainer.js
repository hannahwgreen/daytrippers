import React, { Component } from 'react';
import TitleField from '../components/TitleField';
import BodyField from '../components/BodyField';

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviewBody: '',
      reviewRating;
      errors: {}
    }

    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
  }

  handleBodyChange(event) {
    this.setState({reviewBody: event.target.value})
  }

  handleRatingChange(event) {
    this.setState({reviewRating: event.traget.value})
  }

  handleFormSubmit(e) {
    e.preventDefault();
    let formPayLoad = {
      reviewBody: this.state.reviewBody,
      reviewRating: this.state.reviewRating,
    };
    this.props.addNewReview(formPayLoad);
  }


  render() {
    return(
      <form className="new-review-form callout" onSubmit={this.handleFormSubmit}>
        <ReviewForm
          content={this.state.reviewBody}
          label="Review"
          name="review"
          handlerFunction={this.handleBodyChange}
        />
        <ReviewForm
          content={this.state.reviewRating}
          label="Rating"
          name="rating"
          handlerFunction={this.handleRatingChange}
        />
        <div className="button-group">
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default ReviewFormContainer;