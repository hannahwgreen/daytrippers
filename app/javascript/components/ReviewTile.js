import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    <div className="review-tile">
        <p>{props.creator}</p>
        <p>{props.body}</p>
        <p>{props.rating}</p>
      <hr/>
    </div>
  )
}

export default ReviewTile;