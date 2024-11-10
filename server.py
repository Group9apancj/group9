from http.server import BaseHTTPRequestHandler, HTTPServer
import os
from io import BytesIO
from PIL import Image
import cv2

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
                image = Image.open(image_data)
                image_path = "uploaded_image.png"
                image.save(image_path)

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
