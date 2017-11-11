import axios from 'axios'
import { IMAGES_FETCH, IMAGES_RECEIVE, IMAGES_SAVE, IMAGES_REMOVE } from "../types";

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
  return {
    type: IMAGES_REMOVE,
    payload: imageId
  }
}

export function selectImage(imageId) {
  return {
    type: IMAGES_SELECT,
    payload: imageId
  }
}

function receiveImages(images) {
  return {
    type: IMAGES_RECEIVE,
    payload: images
  }
}