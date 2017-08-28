from flask import Flask
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()
app.config.from_object('config')
mysql.init_app(app)
db = mysql.connect()
cur = db.cursor()

from app import views