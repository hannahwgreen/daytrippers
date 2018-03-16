import React from 'react';
import { Link } from 'react-router';

const TripTile = (props) => {
  return(
    <div>
        <h2><Link to={`/trips/${props.id}`}>{props.name}</Link></h2>
        <p>{props.description}</p>
    </div>
  )
}

export default TripTile;