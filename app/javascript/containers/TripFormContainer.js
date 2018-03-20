import React, { Component } from 'react';
import TripTextField from '../components/TripTextField';
import TripTextAreaField from '../components/TripTextAreaField';
import {browserHistory} from 'react-router';

class TripFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: '',
      description: '',
      errors: {}
    }
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    this.validateName = this.validateName.bind(this);
    this.validateDescription= this.validateDescription.bind(this);
    this.handleClear = this.handleClear.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.addNewTrip = this.addNewTrip.bind(this);
  }
    
  addNewTrip(submission) {
    fetch('/api/v1/trips', {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(submission),
      headers: { 'Content-Type': 'application/json' }
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
    .then(body => browserHistory.push(`/trips/${body.trip.id}`))
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  
  handleNameChange(event) {
    this.setState({name: event.target.value})
  }
  
  handleDescriptionChange(event) {
    this.setState({description: event.target.value})
  }
  
  validateName(name) {
    if (name === '' || name === ' ') {
      let newError = { name: 'Name may not be blank.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.name
      this.setState({ errors: errorState })
      return true
    }
  }
  
  validateDescription(description) {
    if (description === '' || description === ' ') {
      let newError = { description: 'Description may not be blank.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.description
      this.setState({ errors: errorState })
      return true
    }
  }
  
  handleClear(event) {
    event.preventDefault();
    this.setState({name: '', description: ''})
  }
  
  handleSubmit(event) {
    event.preventDefault();
    if (
      this.validateName(this.state.name) &&
      this.validateDescription(this.state.description)
    )
    {
      let formPayload = {
        name: this.state.name,
        description: this.state.description
      }
      
      this.addNewTrip(formPayload)
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
      <div className="container mt-5">
      <h3>Add a trip</h3>
      <form onSubmit={this.handleSubmit}>
        {errorDiv}
        <TripTextField
          content={this.state.name}
          label="Name"
          name="name"
          handlerFunction={this.handleNameChange}
        />
        <TripTextAreaField
          content={this.state.description}
          label="Description"
          name="description"
          handlerFunction={this.handleDescriptionChange}
        />
        
        <div className="button-group">
          <button className="btn btn-light mr-3" onClick={this.handleClear}>Clear</button>
          <button className="btn btn-primary" type="submit" value="Submit">Submit</button>
        </div>
      </form>
    </div>
    )
  }
}

export default TripFormContainer;
