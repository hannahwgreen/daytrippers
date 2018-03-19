import React from 'react';

const TripTextAreaField = (props) => {
  return (
    <label>{props.label}
      <textarea
        name={props.name}
        type='text'
        value={props.content}
        onChange={props.handlerFunction}
      />
    </label>
  );
}

export default TripTextAreaField;
