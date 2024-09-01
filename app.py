from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello_world():
    data = {
        'message': 'Hello, World!',
        'status': 'success'
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(host="127.0.0.1",port=9099,debug=True)