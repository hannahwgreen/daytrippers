import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import HomeContainer from './containers/HomeContainer';

const App = (props) => {
  return (
    <div>
      <Router history={browserHistory}>
        <Route path='/' component={HomeContainer} >
          <IndexRoute component={HomeContainer} />
        </Route>
      </Router>
    </div>
  );
}

export default App;