import { createStore, applyMiddleware, compose } from 'redux';
import rootReducer from './rootReducer';
import thunk from 'redux-thunk';

let composeEnhancers = compose;
if (process.env.NODE_ENV !== 'production') {
  if (typeof window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ === 'function') {
    composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__;
  } else {
    window.console.warn('Redux DevTools Chrome extension not found! Please follow installation ' +
      'instruction at: https://github.com/zalmoxisus/redux-devtools-extension');
  }
}

const store = createStore(
  rootReducer,
  composeEnhancers(
    applyMiddleware(
      thunk
    )
  )
);

export default store;