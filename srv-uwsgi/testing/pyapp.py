#!/usr/bin/env python3
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
#
app = Flask(__name__)
#app.config['TEMPLATES_AUTO_RELOAD'] = True
#
#
@app.route('/', methods=['GET'])
def show_root():
    return '<h1>Server working!</h1>'
#
#
if __name__ == '__main__':
    app.run(host='0.0.0.0', port='8001')
