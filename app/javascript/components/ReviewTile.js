import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  let upVoteClass = "fa fa-arrow-alt-circle-up"
  let downVoteClass = "fa fa-arrow-alt-circle-down"

  if (props.userVotes) {
    let userVote = props.userVotes.filter(vote => {return vote.review_id == props.id})[0]
    if (userVote.value == 2) {
      upVoteClass = upVoteClass + " upvoted"
    } else if (userVote.value == 0) {
      downVoteClass = downVoteClass + " downvoted"
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
        <button onClick={props.upVote} type="button" className='voter'>
            <i className={upVoteClass} aria-hidden="true"></i>
        </button>
        <button onClick={props.downVote} type="button" className='voter'>
            <i className={downVoteClass} aria-hidden="true"></i>
        </button>
      </div>
    </div>
  )
}

export default ReviewTile;
