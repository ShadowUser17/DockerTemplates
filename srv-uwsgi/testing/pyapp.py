#!/usr/bin/env python3
from flask import Flask
from flask import request
from flask import redirect
from flask import Response
#
from urllib import parse as urlparse
#
app = Flask(__name__)
#
@app.route('/', methods=['GET', 'POST', 'HEAD'])
def show_root():
    if request.method == 'GET':
        return Response('Server working!')
    #
    elif request.method == 'POST':
        data = urlparse.urlencode(request.form)
        data = '{}: {}'.format(request.method, data)
        return Response(data)
    #
    else: return Response()
#
#
if __name__ == '__main__':
    app.run(host='127.0.0.1', port='8001')
