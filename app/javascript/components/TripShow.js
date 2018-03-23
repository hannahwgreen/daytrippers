import React from 'react';
import { browserHistory, Link } from 'react-router';

const TripShow = (props) => {
  let background_image = ''
  if(props.image != null) {
    background_image = {backgroundImage: `url(${props.image})`, backgroundSize: 'cover', backgroundPosition: 'center' };
  } else {
    background_image = {backgroundImage: `url('https://www.bb-nj.com/wp-content/uploads/2018/01/brigantine-beach-sandy-sunset.jpeg')`, backgroundSize: 'cover'};
  }
  
  return(
    
    <div className="jumbotron jumbotron-fluid" style={background_image}>
      <div className="container">
        <h1 className="display-4 trip-name">{props.name}</h1>
        <p className="lead trip-description">{props.description}</p>
      </div>
    </div>
          
  )
}

export default TripShow;