import { combineReducers } from 'redux';
import images from './reducers/images';

const rootReducer = combineReducers({
  images
});

export default rootReducer;