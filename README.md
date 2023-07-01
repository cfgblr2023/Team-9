![image](https://github.com/cfgblr2023/Team-9/assets/71785031/04ab5018-f2c5-4795-9cf4-272238b012b8)# Team-9

# Image Classification with Xception Model

This project demonstrates how to perform image classification using the Xception model. The Xception model is a deep convolutional neural network (CNN) architecture that has been pre-trained on the ImageNet dataset.

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Description

The project focuses on training an image classification model using the Xception architecture. It utilizes the TensorFlow library and the `tensorflow.keras` module for building and training the model. The dataset used in this project consists of images related to various issues, and their corresponding labels are extracted from a CSV file.

The main steps involved in this project are as follows:

1. Loading and preprocessing the images.
2. Encoding the labels into numerical values.
3. Creating and compiling the Xception model.
4. Training the model on the image dataset.
5. Saving the trained model for future use.

## Installation

To run this project, you need to set up the following dependencies:

- Python (version 3.6 or higher)
- TensorFlow (version 2.0 or higher)
- Pandas
- OpenCV (cv2)

You can install the required dependencies using pip:

```bash
$ pip install tensorflow pandas opencv-python
```

Additionally, you need to download the Xception model's pre-trained weights. These weights will be automatically downloaded when you run the code for the first time.

## Usage

1. Ensure that you have the image dataset and its corresponding CSV file ready. The CSV file should contain columns for image paths and labels.
2. Update the file paths in the code to match the location of your dataset and CSV file.

```python
df = pd.read_csv('path_to_csv_file')
photos = df['Photo'].values
# ...
image = load_img('path_to_image_directory/' + photo, target_size=(299, 299))
```

3. Run the Python script to start the training process:

```bash
$ python image_classification.py
```

4. The trained model will be saved as `xception_model.h5` in the current directory.

## Contributing

Contributions to this project are welcome. If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your changes to your fork.
5. Submit a pull request.
## Model sample predictions
![image](https://github.com/cfgblr2023/Team-9/assets/71785031/b0aff140-7474-4575-a34a-78210169f4ef)
![image](https://github.com/cfgblr2023/Team-9/assets/71785031/37b5e22c-93d0-42be-b108-282193cce418)
![image](https://github.com/cfgblr2023/Team-9/assets/71785031/8cd81eb8-ac93-4e37-b8f9-0a2d572c2a8a)

## License

This project is licensed under the [MIT License](LICENSE).
