import os
import glob
import json
from flask import Flask, request, Response
from flask import abort

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def home():

    response = {'message': "IT WORKS!!!!"}

    return Response(response=json.dumps(response), status=200, mimetype="application/json")


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
