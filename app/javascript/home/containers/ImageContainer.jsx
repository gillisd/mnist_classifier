import React, { Component } from 'react'
import { connect } from 'react-redux'
import { fetchImages } from "../actions/images";
import PropTypes from 'prop-types';

const styles = {
  image: {
    height: '100px'
  }
};

class ImageContainer extends Component {

  componentWillMount() {
    this.props.fetchImages();
  }

  render() {
    const { currentImage } = this.props;
    if (currentImage) {
      return (
        <div>
          <img style={styles.image} alt="Embedded Image" src={`data:image/png;base64,${currentImage.base64_string}`}/>
        </div>
      )
    } else {
      return <div>Loading...</div>
    }

  }
}

function mapStateToProps(state) {
  return {
    currentImage: state.images.images[0]
  }
}

ImageContainer.propTypes = {
  currentImage: PropTypes.shape({
    id: PropTypes.number.isRequired,
    base64_string: PropTypes.string.isRequired
  })
};

export default connect(mapStateToProps, { fetchImages })(ImageContainer);