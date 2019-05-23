"""
Routes and views for the bottle application.
"""

from bottle import route, view,redirect
from models import *
from config import *

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    based=basedict()
    dd= dict(
        title='Home',
        message='Your contact page.'
    )
    dd.update(based)
    return dd

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    based=basedict()
    dd= dict(
        title='Contact',
        message='Your contact page.'
    )
    dd.update(based)
    return dd


@route('/about')
@view('about')
def about():
    """Renders the about page."""
    based=basedict()
    dd= dict(
        title='About',
        message='Your About page.'
    )
    dd.update(based)
    return dd


@route('/login')
@view('login')
def login():
    based=basedict()
    dd= dict(
        title='Login'
    )
    dd.update(based)
    return dd

@route('/login',method='POST')
@view('login')
def login():
    username = request.forms.username
    password = request.forms.password

    if username.strip() and password.strip():
        u = check_login(username, password)
        if u:
            s = request.environ.get('beaker.session')
            s['nick'] = u.nick
            s['id'] = u.id
            s.save()
            redirect('/')

    based=basedict()
    dd= dict(
        title='Login'
    )
    dd.update(based)
    return dd