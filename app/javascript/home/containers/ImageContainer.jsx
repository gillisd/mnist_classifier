import React, { Component } from 'react'
import { connect } from 'react-redux'
import { fetchImages, saveImage } from "../actions/images";
import PropTypes from 'prop-types';
import ImageForm from "../components/ImageForm";


class ImageContainer extends Component {

  componentWillMount() {
    this.props.fetchImages();
  }

  render() {
    const { currentImage, saveImage, outOfImages, isFetching } = this.props;
    return (
      <ImageForm onSubmit={saveImage} outOfImages={outOfImages} isFetching={isFetching} currentImage={currentImage}/>
    )
  }
}

function mapStateToProps(state) {
  let outOfImages = false;
  const images = state.images.images;
  const currentImage = images && images[0];

  if (images && (images.length === 0)) {
    outOfImages = true
  }

  return {
    currentImage,
    isFetching: state.images.isFetching,
    outOfImages
  }
}

ImageContainer.propTypes = {
  currentImage: PropTypes.shape({
    id: PropTypes.number.isRequired,
    base64_string: PropTypes.string.isRequired
  })
};

export default connect(mapStateToProps, { fetchImages, saveImage })(ImageContainer);