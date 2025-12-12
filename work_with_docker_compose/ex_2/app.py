from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def index():
    db_host = os.getenv('POSTGRES_HOST', 'localhost')
    db_port = os.getenv('POSTGRES_PORT', '5432')
    db_name = os.getenv('POSTGRES_DB', 'mydb')
    user = os.getenv('POSTGRES_USER', 'user')
    password = os.getenv('POSTGRES_PASSWORD', 'password')
    return f"Connected to DB at {db_host}:{db_port} with db={db_name} and user={user}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)