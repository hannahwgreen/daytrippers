import React from 'react';
import { Link } from 'react-router';

const TripTile = (props) => {
  return(
    <div className="card mb-3">
      <div className="card-body">
        <h5 className="card-title">{props.name}</h5>
        <p className="card-text">{props.description}</p>
        <Link className="text-success" to={`/trips/${props.id}`}>Learn more</Link>
      </div>
    </div>
  )
}

export default TripTile;