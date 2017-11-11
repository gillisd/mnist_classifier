import { IMAGES_FETCH, IMAGES_RECEIVE, IMAGES_REMOVE } from "../types";
import _ from 'lodash';

const INITIAL_STATE = {
  images: null,
  isFetching: false
};

const images = (state = INITIAL_STATE, action) => {

  switch (action.type) {
    case IMAGES_FETCH: {
      return {
        ...state,
        isFetching: true
      }
    }

    case IMAGES_REMOVE: {
      const { images } = state;
      const index = images.findIndex((images) => images.id === action.payload);
      if (index === -1) {
        return state
      } else {
        return {
          ...state,
          images: [
            ...images.slice(0, index),
            ...images.slice(index + 1)
          ]
        }
      }
    }

    case IMAGES_RECEIVE: {
      return {
        ...state,
        images: _.shuffle(action.payload),
        isFetching: false
      }
    }

    default: {
      return state;
    }
  }

};

export default images;