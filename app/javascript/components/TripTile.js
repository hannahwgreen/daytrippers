import React from 'react';
import { Link } from 'react-router';

const TripTile = (props) => {
  
  return(    
    <div className="col-lg-4 col-md-6">
      <div className="card">
        <div className="wrapper">
          <img className="card-img-top" src={props.image} alt="Card image cap" />
        </div>
        <div className="card-body">
          <h5 className="card-title">{props.name}</h5>
          <p className="card-text">{props.description}</p>          
        </div>
        <div className="card-footer">
          <Link className="text-success" to={`/trips/${props.id}`}>Learn more</Link>
        </div>
      </div>
    </div>        
  )
}

export default TripTile;