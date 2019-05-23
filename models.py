from pony.orm import *
from datetime import date,datetime

db=Database('sqlite', filename="blog.sqlite", create_db=True)


class User(db.Entity):
    name=Required(str)
    nick=Required(str)
    password=Required(str)
    email=Required(str,unique=True)
    regdate=Required(date)
    blogs=Set("Blog")
    photos=Set("Photo")

class Blog(db.Entity):
    title=Required(str)
    content=Required(str)
    update=Required(date)
    author=Required(User)

class Photo(db.Entity):
    name=Required(str)
    ext=Required(str)
    url=Required(str)
    size=Required(str)
    update=Required(date)
    author=Required(User)

sql_debug(True)
db.generate_mapping(create_tables=True)
today=datetime.now()

@db_session
def populate_database():
    if select(u for u in User).count()>0:
        addtable_database()
        return
    u1=User(name='zhou',nick='fun',password='123',email='zhou@bottle.com',regdate=today)
    u2=User(name='shen',nick='阳光',password='123',email='shen@bottle.com',regdate=today)
    Blog(title='Every day',content='Meet a better self every day !',update=today,author=u1)
    Blog(title='每一天',content='每一天遇见更好的自己！',update=today,author=u2)

@db_session
def addtable_database():
    if select(p for p in Photo).count()>0:
        return
    Photo(name='1',ext='jpg',url='/upload/1.jpg',size='557kb',update=today,author=User[1])
    Photo(name='2',ext='jpg',url='/upload/2.jpg',size='40kb',update=today,author=User[1])


populate_database()

@db_session
def check_login(username,password):
    loginuser = select(u for u in User if u.name == username and u.password == password).first()
    return loginuser










