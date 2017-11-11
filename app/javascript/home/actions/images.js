import axios from 'axios'
import { IMAGES_FETCH, IMAGES_RECEIVE, IMAGES_REMOVE } from "../types";

export function fetchImages() {
  return function (dispatch) {

    dispatch({ type: IMAGES_FETCH });

    const url = '/mnist_images';
    return axios.get(url)
      .then((response) => {
        return dispatch(receiveImages(response.data));
      })
  }
}

export function saveImage({ imageId, label }) {
  return function (dispatch) {
    return axios.post('/mnist_images/label', { label, id: imageId })
      .then(() => {
        dispatch(removeImage(parseInt(imageId)))
      })
      .catch((error) => alert('Something went wrong, please try again'))
  }
}

export function removeImage(imageId) {
  return function (dispatch, getState) {
    if (getState().images.images.length < 2) {
      dispatch(fetchImages())
    } else {
      dispatch({ type: IMAGES_REMOVE, payload: imageId })
    }
  }
}

function receiveImages(images) {
  return {
    type: IMAGES_RECEIVE,
    payload: images
  }
}