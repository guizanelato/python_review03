from datetime import datetime
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def hello_world():
    return jsonify({
        'timestamp': str(datetime.now()),
        'mensagem': 'teste pipeline jenkins'
            
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

