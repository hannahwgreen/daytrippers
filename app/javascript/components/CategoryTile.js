import React from 'react';
import { Link } from 'react-router';

const CategoryTile = (props) => {
  return(
    <li>
        <Link to={`/categories/${props.id}`} onClick={props.handleClick} className={props.className}>{props.name}</Link>
    </li>
  )
}

export default CategoryTile;