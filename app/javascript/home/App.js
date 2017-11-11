import React, { Component } from 'react';
import { Provider } from 'react-redux';
import store from './store';
import ImageFormContainer from './containers/ImageFormContainer'
import axios from 'axios';

const csrfToken = document.getElementsByTagName('meta')['csrf-token']['content'];

axios.interceptors.request.use((request) => {
  return { ...request, headers: { ...request.headers, 'X-CSRF-Token': csrfToken } };
}, (error) => {
  return Promise.reject(error);
});

class App extends Component {

  render() {
    return (
      <Provider store={store}>
        <ImageFormContainer/>
      </Provider>
    );
  }
}


export default App;