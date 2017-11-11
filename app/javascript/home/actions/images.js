import axios from 'axios'
import { IMAGES_FETCH, IMAGES_RECEIVE, IMAGES_SAVE } from "../types";

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

export function saveImage(imageId) {
  return function (dispatch) {
    return axios.post('http://localhost:8000/images/', { remote_id: imageId, post_id: 1 })
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