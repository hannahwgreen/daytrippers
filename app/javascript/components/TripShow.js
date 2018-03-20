import React from 'react';
import { browserHistory, Link } from 'react-router';

const TripShow = (props) => {
  return(
    <div className="trip-show">
      <h2>{props.name}</h2>
      <p>{props.description}</p>
    </div>
  )
}

export default TripShow;