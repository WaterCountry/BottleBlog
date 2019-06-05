"""
Routes and views for the bottle application.
"""

from bottle import route, view,redirect,request,template,static_onefile
from models import *
from config import baseinfo,getfilepath
from pony.orm import db_session
import html
from os.path import abspath,dirname,join,splitext
from urllib.parse import unquote,urlencode



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

@route('/member')
@db_session
def contact():
    """Renders the contact page."""
    nicks=select(u.nick for u in User )
    bf=baseinfo()

    dd= dict(title='member',info=bf,nicks=nicks)

    return template('member',dd)


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
            return redirect('/')

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
    plimit=5
    blogs=select(b for b in Blog )
    blogscount=blogs.count()
    pnum= int( blogscount/plimit)
    if blogscount>pnum*plimit:
        pnum=pnum+1

    blogs=blogs.page(int(page),plimit)

    bf = baseinfo()
    dd = dict( title='Blog',info=bf, blogs=blogs,pagecount=pnum,cpage=int(page))

    return template('blog',dd)

@route('/blog/:id')
@db_session
def detail(id):
    b=Blog[id]
    bf=baseinfo()
    dd= dict(title='Detail',info=bf,blog=b)

    return template('detail',dd)



@route('/add',method='POST')
@db_session
def add():
    bf = baseinfo()
    if bf.auth:
        title = request.forms.title
        content = request.forms.content
        if title.strip() and content.strip():
            content=html.unescape(content)
            b = Blog(title=title, content=content, update=today, author=bf.id)
            commit()
            # must commit,otherwise not add anything
            #必须要提交，否则添加不了内容

            return redirect("/blog/%d" % b.id)
    else:
        return redirect('/blog')



@route('/add')
@view('add')
def add():
    bf = baseinfo()
    if bf.auth:
        dd = dict(
            title='Add news',
            info=bf
        )
        return dd
    else:
        return redirect('/blog')


@route('/edit/:id')
@db_session
def edit(id):
    bf=baseinfo()
    if bf.auth:
        b=Blog[id]
        dd= dict(title='Edit',info=bf,blog=b)
        return template('edit',dd)
    else:
        return redirect("/blog/%s" % id)  # id is string , must be %s ,not be %d


@route('/edit/:id',method='POST')
@db_session
def add(id):
    title = request.forms.title
    content = request.forms.content
    if title.strip() and content.strip():
        content=html.unescape(content)
        b = Blog[id]
        b.title=title
        b.content=content
        b.update=today
        commit()
        # We must put the commit() command here, but it is very necessary
        # because PonyPlugin will take no care of this!!!
        return redirect("/blog/%d" % b.id)


@route('/register')
@view('register')
def register():
    bf=baseinfo()
    dd= dict(
        title='register',
        info=bf
    )
    return dd


@route('/register',method='POST')
@view('register')
@db_session
def register():
    username = request.forms.username
    password = request.forms.password
    nick = request.forms.nick

    if username.strip() and password.strip():
        u = User( name=username, nick=nick, password=password,email='reg@bottle.com', regdate=today)
        commit()
        s = request.environ.get('beaker.session')
        s['nick'] = u.nick
        s['id'] = u.id
        s['auth'] = True
        s.save()
        return redirect('/')
    else:
        return "need username and password! "


@route('/photo')
@db_session
def photo():
    page=request.query.page or '1'
    plimit=6
    photos=select(p for p in Photo)
    photoscount=photos.count()
    pnum= int( photoscount/plimit)
    if photoscount>pnum*plimit:
        pnum=pnum+1

    photos=photos.page(int(page),plimit)


    bf = baseinfo()
    dd = dict(title='Photo',info=bf,photos=photos,pagecount=pnum,cpage=int(page),thispage=page,author=bf.auth)
    return template('picture',dd)


@route('/upload',method='POST')
@db_session
def upload():
    page=request.query.page or '1'
    data = request.files.data  # 获取上传的文件

    if not data:
        return "select file please!"

    bf = baseinfo()
    if not bf.auth:
        return "Not allowed!"

    upurl='/store/'
    uploadpath = './store/'  # 定义上传文件的保存路径
    data.save(uploadpath, overwrite=True)  # overwrite参数是指覆盖同名文件
    fname= data.filename.strip()
    ext=splitext(fname)[1]

    raw=data.file.read()
    size=str(int( len(raw)/1024))+'kb'

    Photo(name=fname,ext=ext,url=upurl+fname,size=size,update=today,author=User[bf.id])
    commit()
    url='/photo?page='+page
    return redirect(url)

@route('/del/:id')
@db_session
def delphoto(id):
    page=request.query.page or '1'
    bf = baseinfo()
    if not bf.auth:
        return "Not allowed!"

    if id:
        p= Photo[id]
        p.delete()

        commit()
        url = '/photo?page=' + page
        return  redirect( url)
    else:
        return "nothing"


@route('/program')
@db_session
def program():
    page = request.query.page or '1'
    plimit = 5
    programs = select(p for p in Program)
    programscount = programs.count()
    pnum = int(programscount / plimit)
    if programscount > pnum * plimit:
        pnum = pnum + 1

    programs = programs.page(int(page), plimit)

    bf = baseinfo()
    dd = dict(title='Program', info=bf, programs=programs, pagecount=pnum, cpage=int(page))

    return template('program', dd)


@route('/')
@route('/program/:id')
@db_session
def code(id=1):
    p=Program[id]
    programs=select(m for m in Program)
    bf=baseinfo()
    dd= dict(title='Code Detail',info=bf,programs=programs,program=p)

    return template('source',dd)

@route('/write')
@view('write')
def add():
    bf = baseinfo()
    if bf.auth:
        dd = dict(
            title='Add program',
            info=bf
        )
        return dd
    else:
        return redirect('/program')

@route('/write',method='POST')
@db_session
def write():
    bf = baseinfo()
    if bf.auth:
        title = request.forms.title
        pcode = request.forms.code
        if title.strip() and pcode.strip():
            pcode=html.unescape(pcode)
            p=Program(title=title,code=pcode,update=today,level='0')
            commit()
            # must commit,otherwise not add anything
            #必须要提交，否则添加不了内容

            return redirect("/program/%d" % p.id)
    else:
        return redirect('/program')


@route('/judge',method='POST')
def judge():
    progradcode=request.forms.code

    return  progradcode

@route('/program/:id',method='POST')
def rewrite(id=1):
    progradcode = request.forms.code
    p=Program[id]
    p.code=progradcode
    return progradcode

