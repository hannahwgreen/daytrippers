import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import HomeContainer from './containers/HomeContainer';
import TripsContainer from './containers/TripsContainer';
import TripShowContainer from './containers/TripShowContainer';
import TripFormContainer from './containers/TripFormContainer';

const App = (props) => {
  return (
    <div>
      <Router history={browserHistory}>
        <Route path='/' >
          <IndexRoute component={HomeContainer} />
          <Route path='/trips/new' component={TripFormContainer}/>
          <Route path="/trips/:id" component={TripShowContainer} />          
        </Route>
      </Router>
    </div>
  );
}

export default App;