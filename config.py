from bottle import request
from datetime import datetime
from beaker.middleware import SessionMiddleware
import os


PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static').replace('\\', '/')
STORE_ROOT = os.path.join(PROJECT_ROOT, 'store').replace('\\', '/')

def baseinfo():
    # base infomation name,year,auth,nick,avatar
    bf=info()
    session=request.environ.get('beaker.session')

    if session:
        bf.nick=session.get('nick')
        bf.auth=session.get('auth')
        bf.id=session.get('id')
    else:
        bf.auth=False

    return bf


class info:
    def __init__(self):
        self.name="Bottle Blog"
        self.year=datetime.now().year
        self.auth=False
        self.id=""
        self.nick="Guest"
        self.avatar='/static/avatar/river.jpg'
        self.title=""
        self.writer="温州水乡"
