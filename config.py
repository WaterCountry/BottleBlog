from bottle import request
from datetime import datetime
from beaker.middleware import SessionMiddleware

appname='Bottle Blog'
thisyear=datetime.now().year

def basedict():
    nick='Guest'
    authed=False
    session=request.environ.get('beaker.session')

    if session:
        authed=True
        nick=session.get('nick')

    return dict(
        year=thisyear,
        appname=appname,
        authed=authed,
        nick=nick,
        avatar='/static/avatar/river.jpg'
    )