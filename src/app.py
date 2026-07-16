import http.server
import redis
import os

# Подключаемся к Redis (он локальный, порт 6379 по умолчанию)
r = redis.Redis(host='localhost', port=6379, db=0)

# Название ключа для счётчика
COUNTER_KEY = 'visits'

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Увеличиваем счётчик
        visits = r.incr(COUNTER_KEY)
        # Формируем HTML
        html = f"""
        <html>
            <head><title>DevOps Init Project</title></head>
            <body>
                <h1>Hello from Python + Redis!</h1>
                <p>This page has been visited {visits} times.</p>
                <hr>
                <small>Powered by Python, Redis, and SSH tunnel</small>
            </body>
        </html>
        """
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(html.encode())

if __name__ == '__main__':
    PORT = 8080
    with http.server.HTTPServer(("0.0.0.0", PORT), MyHandler) as httpd:
        print(f"Serving on port {PORT}")
        httpd.serve_forever()