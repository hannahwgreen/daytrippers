import React from 'react';

const TripTextField = (props) => {
  return (
    <div className="form-group">
    <label>{props.label}</label>
      <input
        name={props.name}
        type='text'
        className='form-control'
        value={props.content}
        onChange={props.handlerFunction}
      />
    
    </div>
  );
}

export default TripTextField;
