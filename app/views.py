from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flaskext.mysql import MySQL
from flask_mail import Mail, Message
import pymysql
import os
import requests

app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'pragyapravah'

# app.config['MYSQL_DATABASE_HOST'] = 'sql12.freesqldatabase.com'
# app.config['MYSQL_DATABASE_USER'] = 'sql12198115'
# app.config['MYSQL_DATABASE_PASSWORD'] = 'Yg4cywvU8g'
# app.config['MYSQL_DATABASE_DB'] = 'sql12198115'

mysql = MySQL(app)

# Initializing Sender Details
app.config['SECRET_KEY'] = 'YouKnowNothingJonSnow'
app.config['MAIL_SERVER']= 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
app.config['MAIL_USERNAME'] = 'prajnaanalytica@gmail.com'
app.config['MAIL_PASSWORD'] = 'qxpbhwgmoqswqnlh'

mail = Mail(app)

API_KEY = 'AIzaSyDWEDWFyan0M89K7BsBi8qlB7n3QOi5ykU'

@app.route('/', methods=['GET', 'POST'])
def index():
	if request.method == 'POST':
		email = request.form['email']
		recipients = []
		recipients.append(email)

		try:
			msg = Message('Subscription successful', sender="prajnaanalytica@gmail.com", recipients=recipients)
			msg.body = "You have successfully subscribed to www.prajnapravah.com"
			mail.send(msg)

			db = mysql.connect()
			cur = db.cursor()
			cur.execute("insert into subscribers (email) values ('{0}')".format(email))
			db.commit()
			db.close()
			
			flash('subscribed')
		
		except pymysql.err.IntegrityError:
			flash('already-subscriber')

		return redirect(url_for('index'))

	if request.method == 'GET':
		imageList = []
		imageFolders = os.listdir(os.path.join(app.static_folder, 'images/home'))
		for folder in sorted(imageFolders):
			dic = dict()
			dic['folder'] = folder
			dic['images'] = sorted(os.listdir(os.path.join(app.static_folder, 'images/home/{0}'.format(folder))))
			imageList.append(dic)

		return render_template('index.html', imageList=imageList)

@app.route('/our-mission')
def mission():
	return render_template('mission.html', title='Our Mission | ')

@app.route('/founders')
def founders():
	return render_template('founders.html', title='Our Founders | ')

@app.route('/events')
def events():
	return render_template('events.html', title='Events | ')

@app.route('/photos/<event>')
def imgs(event):
	imageList = os.listdir(os.path.join(app.static_folder, 'images/gallery/{0}'.format(event)))
	if not imageList:
		flash('No images for this event yet')

	return render_template('eventImages.html', title='{0} images | '.format(event), images=sorted(imageList), event=event)

@app.route('/photos')
def photos():
	eventList = next(os.walk(os.path.join(app.static_folder, 'images/gallery')))[1]
	if not eventList:
		flash('No events yet')

	eventList.sort()
	return render_template('photos.html', title='Photos | ', events=eventList)

@app.route('/video')
def vids():
	videoId = request.args.get('id', None)
	videoTitle = request.args.get('title', None)

	url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&id={0}&key={1}'.format(videoId, API_KEY)
	response = requests.get(url).json()
	description = response['items'][0]['snippet']['description']
	
	pageTitle = '{0} | '.format(videoTitle)
	return render_template('vid.html', title=pageTitle, videoTitle=videoTitle, description=description, videoId=videoId)

@app.route('/videos')
@app.route('/videos/<page>')
def videos(page=0):
	videos = []
	db = mysql.connect()
	cur = db.cursor()
	cur.execute('select * from videos')
	vidList = cur.fetchall()
	db.close()
	
	if not vidList:
		flash('No videos available yet')

	vidList = sorted(vidList, key=lambda x: x[2], reverse=True) if vidList else []
	page = int(page)
	count = page * 12

	# page numbering starts from 0 and not 1; page 2 is numbered 1 and so on
	if count >= len(vidList) and not count == 0:
		abort(404)

	if count == 0:
		nxt = -1 if (count + 12) >= len(vidList) else page + 1
		prev = -1

	elif not count == 0:
		nxt = -1 if (count + 12) >= len(vidList) else page + 1
		prev = page - 1

	vidList = vidList[count:] if (count + 12) > len(vidList) else vidList[count:(count + 12)]
	for _id, videoTitle, dt in vidList:	
		thumbnail = 'http://img.youtube.com/vi/{0}/mqdefault.jpg'.format(_id)
		videos.append((videoTitle, _id, thumbnail, dt))

	return render_template('videos.html', title='Videos | ', videos=videos, nxt=nxt, prev=prev)

@app.route('/contact-us', methods=['GET', 'POST'])
def contactUs():
	if request.method == 'POST':
		name = request.form['name']
		email = request.form['email']
		phone = request.form['phone']
		message = request.form['message']

		msg = Message('{0} | {1}'.format(name, phone), sender="prajnaanalytica@gmail.com", recipients=["prajnapravah01@gmail.com"])
		msg.body = "Name: {0}\nEmail: {1}\nPhone No.: {2}\nMessage: {3}".format(name, email, phone, message)
		mail.send(msg)

		flash('Details submitted successfully')
		return redirect(url_for('contactUs'))

	if request.method == 'GET':
		return render_template('contactUs.html', title='Contact Us | ')

@app.route('/developers')
def developers():
	return render_template('developers.html', title='Meet the Developers')

@app.route('/article')
def article():
	title = request.args.get('title', None)
	db = mysql.connect()
	cur = db.cursor()
	cur.execute("select filename, author, date, publishedAt from articles where title = '{title}'".format(title=title))
	data = cur.fetchall()
	
	if not data:
		abort(404)

	for f, a, d, p in data:
		filename = 'articles/{0}'.format(f)
		author = a
		date = d
		publishedAt = p

	if not os.path.isfile('{0}/../templates/{1}'.format(app.static_folder, filename)):
		abort(404)

	pageTitle = '{0} | '.format(title)
	return render_template('article.html', title=pageTitle, articleTitle=title, date=date, author=author, publishedAt=publishedAt, filename=filename)

@app.route('/articles')
def articles():
	db = mysql.connect()
	cur = db.cursor()
	cur.execute('select title, author, date, publishedAt, imagefile from articles')
	articleList = cur.fetchall()
	db.close()

	if not articleList:
		flash('No articles available yet')

	articles = sorted(articleList, key=lambda x: x[2], reverse=True) if articleList else []
	return render_template('articles.html', title='Articles | ', articles=articles)

@app.route('/newsletters')
def newsletters():
	db = mysql.connect()
	cur = db.cursor()
	cur.execute('select * from ebooks')
	bookList = cur.fetchall()
	db.close()

	if not bookList:
		flash('No newsletters available yet')
	
	ebooks = sorted(bookList, key=lambda x: x[1]) if bookList else []
	return render_template('ebooks.html', title='Ebooks | ', ebooks=ebooks)

@app.route('/tweets')
def tweets():
	return render_template('tweets.html', title='Tweets by Prajna Pravah | ')

@app.errorhandler(500)
def internal_server_error(e):
	return render_template('error.html', title='Internal Server Error | ', code=500, error_code='Internal Server Error'), 500

@app.errorhandler(403)
def forbidden_access(e):
	return render_template('error.html', title='Access forbidden | ', code=403, error_code="Forbidden: You don't have access to this resource"), 403

@app.errorhandler(404)
def page_not_found(e):
	return render_template('error.html', title='Page Not Found | ', code=404, error_code=e), 404

if __name__ == '__main__':
	# app.run()
	app.run(debug=True)