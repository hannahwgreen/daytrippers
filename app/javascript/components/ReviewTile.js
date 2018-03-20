import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    
    <li className="media mb-4">
      <img className="mt-1 mr-3" src={props.avatar} alt="" />
      <div className="media-body">
        <h5 className="my-0">{props.creator}</h5>
        <p className="my-0">{props.body}</p>
        <p className="my-0">Rating: {props.rating}</p>
      </div>
    </li>
  )
}

export default ReviewTile;