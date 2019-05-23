"""
Routes and views for the bottle application.
"""

from bottle import route, view,redirect,request,template
from models import *
from config import baseinfo
from pony.orm import db_session
import html

@route('/')
@route('/home')
@view('home')
def home():
    """Renders the home page."""
    bf=baseinfo()
    dd= dict(
        title='Home',
        info=bf
    )
    return dd

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    bf=baseinfo()
    dd= dict(
        title='contact',
        info=bf
    )
    return dd


@route('/about')
@view('about')
def about():
    """Renders the about page."""
    bf=baseinfo()
    dd= dict(
        title='about',
        info=bf
    )
    return dd

@route('/logout')
@view('home')
def logout():
    s=request.environ.get('beaker.session')
    s.delete()

    bf=baseinfo()
    dd= dict(
        title='Home',
        info=bf
    )
    return dd

@route('/login')
@view('login')
def login():
    bf=baseinfo()
    dd= dict(
        title='login',
        info=bf
    )
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
            s['auth']=True
            s.save()
            redirect('/')

    bf=baseinfo()
    dd= dict(
        title='Home',
        info=bf
    )
    return dd


faviconico='/static/images/book.gif'

@route('/favicon.ico')
def favicon():
    return faviconico

@route('/blog')
@db_session
def blog():
    page=request.query.page or '1'
    plimit=10
    blogs=select(b for b in Blog )
    blogscount=blogs.count()
    pnum= int( blogscount/plimit)
    if blogscount>pnum*plimit:
        pnum=pnum+1

    blogs=blogs.page(int(page),plimit)

    bf = baseinfo()
    dd = dict( title='Blog',info=bf, blogs=blogs,pagecount=pnum,cpage=int(page))

    return template('blog',dd)

@route('/blog/<bid>')
@db_session
def detail(bid):
    b=Blog[bid]
    bf=baseinfo()
    dd= dict(title='Detail',info=bf,blog=b)

    return template('detail',dd)


@route('/add',method='POST')
@db_session
def add():
    title = request.forms.title
    content = request.forms.content
    if title.strip() and content.strip():
        content=html.unescape(content)
        user_id =  1
        b = Blog(title=title, content=content, update=today, author=User[user_id])
        url='/blog/'+str(b.id)

        redirect(url)


@route('/add')
@view('add')
def add():
    bf = baseinfo()
    dd = dict(
        title='Add',
        info=bf
    )
    return dd