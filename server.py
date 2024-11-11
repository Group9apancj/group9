from http.server import BaseHTTPRequestHandler, HTTPServer
import os
from io import BytesIO
from PIL import Image
from modelClass import Model
from tensorflow.keras.preprocessing import image

class MyServer(BaseHTTPRequestHandler):
    def _set_headers(self, status_code=200):
        self.send_response(status_code)
        self.send_header('Content-type', 'application/json')
        self.end_headers()

    def do_POST(self):
        if self.path == '/upload_image':
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)

            try:
                image_data = BytesIO(post_data)
                image1 = Image.open(image_data)
                image_path = "uploaded_image.png"
                image1.save(image_path)

                img = image.img_to_array(image.load_img(image_path))

                model=Model()
                staff=model.feedImage(img)
                print(staff)

                self._set_headers()
                self.wfile.write(b'{"status": "Image received and saved"}')

            except Exception as e:
                self._set_headers(400)
                error_message = f'Error: {str(e)}'
                self.wfile.write(bytes(error_message, 'utf-8'))

def run(server_class=HTTPServer, handler_class=MyServer, port=5000):
    server_address = ('192.168.1.125', port)
    httpd = server_class(server_address, handler_class)
    print(f'Server running on port {port}...')
    httpd.serve_forever()

if __name__ == "__main__":
    run()
