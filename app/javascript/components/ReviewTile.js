import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  let buttonUpClass = "voter"
  let buttonDownClass = "voter"

  if (props.userVotes) {
    let userVote = props.userVotes.filter(vote => {return vote.review_id == props.id})[0]
    if (userVote) {
      if (userVote.value == 2) {
        buttonUpClass = buttonUpClass + " upvoted"
      } else if (userVote.value == 0) {
        buttonDownClass = buttonDownClass + " downvoted"
      }
    }
  }


  return(
    <div className="media mb-4">
      <img className="mt-1 mr-3" src={props.avatar.thumb.url} alt="" />
      <div className="media-body">
        <h5 className="my-0">{props.creator}</h5>
        <p className="my-0">{props.body}</p>
        <p className="my-0">Rating: {props.rating}</p>
      </div>
      <div className='scorebox'>
        <p>{props.score}</p>
        <button onClick={props.upVote} type="button" className={buttonUpClass}>

            <i className="fa fa-arrow-alt-circle-up" aria-hidden="true"></i>
        </button>
        <button onClick={props.downVote} type="button" className={buttonDownClass}>
            <i className="fa fa-arrow-alt-circle-down" aria-hidden="true"></i>
        </button>
      </div>
    </div>
  )
}

export default ReviewTile;
