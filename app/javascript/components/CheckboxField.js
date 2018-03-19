import React from 'react';

const CheckBoxField = (props) => {
  return (
    <label>{props.label}
      <input
        label={props.name}
        type='text'
        value={props.category_id}
        onChange={props.handlerFunction}
      />
    </label>
  );
}

export default TripTextField;