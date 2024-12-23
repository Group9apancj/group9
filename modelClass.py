import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
from PIL import Image
from tensorflow.keras.applications.resnet50 import preprocess_input, decode_predictions
from tensorflow.keras.preprocessing import image
from tensorflow.keras.preprocessing.image import ImageDataGenerator

class Model:
    def __init__(self):
        self.model=load_model("C:/Users/acer/OneDrive/Desktop/testingModel.h5")
        print(self.model.summary())

        label=ImageDataGenerator()
        self.labels=label.flow_from_directory(
            "C:/Users/DELL/Desktop/alldatasets/Skin_Conditions",
            class_mode='categorical'
        ).class_indices



    def feedImage(self,image):
        img=tf.image.resize(image,(224,224))
        img_array = tf.keras.preprocessing.image.img_to_array(img)

        img_array = tf.expand_dims(img_array, axis=0)

        img_array = tf.keras.applications.mobilenet_v2.preprocess_input(img_array)

        predictions = self.model.predict(img_array)

        predicted_class = np.argmax(predictions, axis=1)

        labels=self.labels

        for val,key in enumerate (labels):
            if val==predicted_class[0]:
                predicted_disease=key

        others={}
        i=0
        for val,key in enumerate (labels):
            others[key]=predictions[0][i]
            i+=1   
            

        return {"predicted":predicted_disease,"position":str(predicted_class[0]),"others":others}

