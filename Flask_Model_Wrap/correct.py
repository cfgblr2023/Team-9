import pickle

import numpy as np
from flask import Flask, jsonify, request
from tensorflow.keras.applications.xception import preprocess_input
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import img_to_array, load_img
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
UPLOAD_FOLDER = "/home/akki/Documents/Flask/uploads"
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/predict',methods=['GET', 'POST'])
def predict():
    if(request.method == 'GET'):
        query = request.args.get('query')
        # ML Code to pickle and unpickle the model

        model = load_model('xception_model.h5')

    # Load the LabelEncoder from a file  Running setup.py clean for TensorRT

        with open('/home/akki/Documents/Flask/label_encoder.pkl', 'rb') as f:
            le = pickle.load(f)

        # if 'file' not in request.files:
        #     return jsonify({'error': 'No file found'})
        file = query
        # file = request.files['file']
        # Load the image and preprocess it
        image = load_img(file, target_size=(299, 299))
        image_array = img_to_array(image)
        preprocessed_image = preprocess_input(image_array)
        preprocessed_image = np.expand_dims(preprocessed_image, axis=0)

        # Make a prediction
        predictions = model.predict(preprocessed_image)

        # Get the indices that would sort the array
        sorted_indices = np.argsort(predictions[0])

        # The last element is the index of the class with highest probability
        highest_prob_index = sorted_indices[-1]

        # The second last element is the index of the class with second highest probability
        second_highest_prob_index = sorted_indices[-2]

        # Get the class names
        highest_class_name = le.inverse_transform([highest_prob_index])
        second_highest_class_name = le.inverse_transform([second_highest_prob_index])

        # Return the predictions as JSON
        return jsonify({
            'class_with_highest_probability': highest_class_name[0],
            'class_with_second_highest_probability': second_highest_class_name[0]
        })


    if(request.method == 'POST'):
        # query = request.args.('query')
        
        imageUrl = "/static/uploads/" + request.files['image'].filename
        image2 = app.config['UPLOAD_FOLDER']+"/"+request.files['image'].filename
        request.files['image'].save(image2)
        img_path = image2


        # file = request.files['file']

        # # ML Code to pickle and unpickle the model
        # if file:
        #     file.read()
        #     print(file)
        model = load_model('xception_model.h5')

    # Load the LabelEncoder from a file  Running setup.py clean for TensorRT

        with open('/home/akki/Documents/Flask/label_encoder.pkl', 'rb') as f:
            le = pickle.load(f)
        # file = query
        # if 'file' not in request.files:
        #     return jsonify({'error': 'No file found'})

        
        # Load the image and preprocess it
        image = load_img(img_path, target_size=(299, 299))
        image_array = img_to_array(image)
        preprocessed_image = preprocess_input(image_array)
        preprocessed_image = np.expand_dims(preprocessed_image, axis=0)

        # Make a prediction
        predictions = model.predict(preprocessed_image)

        # Get the indices that would sort the array
        sorted_indices = np.argsort(predictions[0])

        # The last element is the index of the class with highest probability
        highest_prob_index = sorted_indices[-1]

        # The second last element is the index of the class with second highest probability
        second_highest_prob_index = sorted_indices[-2]

        # Get the class names
        highest_class_name = le.inverse_transform([highest_prob_index])
        second_highest_class_name = le.inverse_transform([second_highest_prob_index])

        # Return the predictions as JSON
        return jsonify({
            'class_with_highest_probability': highest_class_name[0],
            'class_with_second_highest_probability': second_highest_class_name[0]
        })

        # data = {"predictions_result": "1"}
        # return jsonify(data)

         
if __name__ == '__main__':
    app.run(debug=True)
