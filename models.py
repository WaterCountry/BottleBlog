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

class Blog(db.Entity):
    title=Required(str)
    content=Required(str)
    update=Required(date)
    author=Required(User)

sql_debug(True)
db.generate_mapping(create_tables=True)
today=datetime.now()

@db_session
def populate_database():
    if select(u for u in User).count()>0:
        return

    u1=User(name='zhou',nick='fun',password='123',email='zhou@bottle.com',regdate=today)
    u2=User(name='shen',nick='阳光',password='123',email='shen@bottle.com',regdate=today)
    Blog(title='Every day',content='Meet a better self every day !',update=today,author=u1)
    Blog(title='每一天',content='每一天遇见更好的自己！',update=today,author=u2)


populate_database()

@db_session
def check_login(username,password):
    loginuser = select(u for u in User if u.name == username and u.password == password).first()
    return loginuser










