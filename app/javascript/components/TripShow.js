import React from 'react';
import { browserHistory, Link } from 'react-router';

const TripShow = (props) => {
  let background_image = ''
  if(props.image != null) {
    background_image = {backgroundImage: `url(${props.image})`, backgroundSize: 'cover' };
  } else {
    background_image = {backgroundImage: `url('https://assets.visitphilly.com/wp-content/uploads/2018/03/Benjamin_Franklin_Parkway_philadelphia-museum-of-art-parkway-photo-by-vp-2200x480px-1600x480.jpg')`, backgroundSize: 'cover'};
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