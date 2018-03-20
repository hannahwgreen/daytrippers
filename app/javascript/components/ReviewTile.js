import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    <div className="review-tile">
        <img src={props.avatar} />        
        <p>{props.creator}</p>
        <p>Posted at: {props.date}</p>
        <p>{props.body}</p>
        <p>{props.rating}</p>
      <hr/>
    </div>
  )
}

export default ReviewTile;