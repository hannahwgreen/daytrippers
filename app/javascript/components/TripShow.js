import React from 'react';
import { browserHistory, Link } from 'react-router';

const TripShow = (props) => {
  return(
    
    <div className="jumbotron jumbotron-fluid">
      <div className="container">
      <h1 className="display-4">{props.name}</h1>
      <p className="lead">{props.description}</p>
    </div>
    </div>
          
  )
}

export default TripShow;