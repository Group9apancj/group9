import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
from PIL import Image

from tensorflow.keras.applications.resnet50 import preprocess_input, decode_predictions
from tensorflow.keras.preprocessing import image

class Model:
    def __init__(self):
        self.model=load_model("C:/Users/DELL/Desktop/alldatasets/models/testingModel.h5")
        print(self.model.summary())

    def feedImage(self,image):

        img=tf.image.resize(image,(224,224))
        img_array = tf.keras.preprocessing.image.img_to_array(img)

        img_array = tf.expand_dims(img_array, axis=0)

        img_array = tf.keras.applications.mobilenet_v2.preprocess_input(img_array)

        predictions = self.model.predict(img_array)

        predicted_class = np.argmax(predictions, axis=1)

        return [predicted_class,predictions]


