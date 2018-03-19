import React from 'react';
import { Link } from 'react-router';

const CategoryTile = (props) => {
  return(
    <li onClick={props.handleClick} className={props.className}>{props.name}</li>
  )
}

export default CategoryTile;