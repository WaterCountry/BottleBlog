from bottle import request
from datetime import datetime
from beaker.middleware import SessionMiddleware


def baseinfo():
    # base infomation name,year,auth,nick,avatar
    bf=info()
    session=request.environ.get('beaker.session')

    if session:
        bf.nick=session.get('nick')
        bf.auth=session.get('auth')
        bf.id=session.get('id')

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
