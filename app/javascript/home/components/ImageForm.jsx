import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { FormGroup, FormControl, Button } from 'react-bootstrap';

const styles = {
  image: {
    height: '100px'
  },
  form: {
    margin: 'auto'
  }
};

class ImageForm extends Component {
  constructor(props) {
    super(props);
    this.state = { value: '' }
  }

  componentWillReceiveProps(nextProps) {
    const { currentImage } = this.props;
    if (currentImage && nextProps.currentImage && (currentImage.id !== nextProps.currentImage.id)) {
      this.setState({ value: '' })
    }
  }

  handleChange = (e) => {
    const { value } = e.target;
    if (!isNaN(value)) {
      this.setState({ value });
    }
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const { onSubmit, currentImage } = this.props;
    const { value } = this.state;
    if (value) {
      onSubmit({ imageId: currentImage.id, label: value });
    }
  };

  render() {
    const { currentImage, outOfImages, isFetching } = this.props;
    if (currentImage) {
      return (
        <div>
          <img style={styles.image} alt="Embedded Image" src={`data:image/png;base64,${currentImage.base64_string}`}/>
          <form onSubmit={this.handleSubmit} style={styles.form}>
            <FormGroup
              controlId="formBasicText"
            >
              <FormControl
                type="text"
                maxLength="1"
                value={this.state.value}
                placeholder="Enter number"
                onChange={this.handleChange}
              />
            </FormGroup>
            <Button type='submit' bsStyle="primary">Submit</Button>
          </form>
        </div>
      )
    } else if (outOfImages) {
      return <div>There are no more images to classify</div>
    } else if (isFetching) {
      return <div>Loading...</div>
    } else {
      return null
    }
  }
}

ImageForm.propTypes = {
  currentImage: PropTypes.shape({
    id: PropTypes.number.isRequired,
    base64_string: PropTypes.string.isRequired
  }),
  onSubmit: PropTypes.func.isRequired
};

export default ImageForm;