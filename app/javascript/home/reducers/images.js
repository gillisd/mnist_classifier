import { IMAGES_FETCH, IMAGES_RECEIVE, IMAGES_SELECT } from "../types";

const INITIAL_STATE = {
  images: [],
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

    case IMAGES_RECEIVE: {
      return {
        ...state,
        images: action.payload,
        isFetching: false
      }
    }

    default: {
      return state;
    }
  }

};

export default images;