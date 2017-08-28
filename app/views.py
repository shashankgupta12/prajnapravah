from flask import render_template, request, flash
from app import app, cur
import requests
import os

API_KEY = 'AIzaSyDWEDWFyan0M89K7BsBi8qlB7n3QOi5ykU'

@app.route('/')
# @app.route('/home')
def index():
	return render_template('index.html', title='Home')

@app.route('/our-vision')
def vision():
	return render_template('vision.html', title='Our Vision')

@app.route('/events')
def events():
	return render_template('events.html', title='Events')

@app.route('/photos/<event>')
def imgs(event):
	imageList = os.listdir(os.path.join(app.static_folder, 'images/gallery/{0}'.format(event)))
	if not imageList:
		flash('No images for this event yet')
	return render_template('eventImages.html', title='{0} images'.format(event), images=imageList, event=event)

@app.route('/photos')
def photos():
	eventList = next(os.walk(os.path.join(app.static_folder, 'images/gallery')))[1]
	if not eventList:
		flash('No events yet')
	eventList.sort()
	return render_template('photos.html', events=eventList, title='Photos')

@app.route('/video')
def vids():
	videoId = request.args.get('id', None)
	videoTitle = request.args.get('title', None)
	url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&id={0}&key={1}'.format(videoId, API_KEY)
	response = requests.get(url)
	res = response.json()
	description = res['items'][0]['snippet']['description']
	link = 'https://www.youtube.com/watch?v={0}'.format(videoId)
	return render_template('vid.html', title='Play Video', videoTitle=videoTitle, description=description, link=link)

@app.route('/videos')
def videos():
	videos = []
	cur.execute('select * from videos')
	vidList = cur.fetchall()
	if not vidList:
		flash('No videos available yet')
	for video in vidList:	
		link = 'https://www.youtube.com/watch?v={0}'.format(video[0])
		url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&id={0}&key={1}'.format(video[0], API_KEY)
		response = requests.get(url)
		res = response.json()
		videoTitle = res['items'][0]['snippet']['localized']['title']
		_id = video[0]
		videos.append((link, videoTitle, _id))

	return render_template('videos.html', title='Videos', videos=videos)

@app.route('/contact-us')
def contactUs():
	return render_template('contactUs.html', title='Contact Us')

@app.route('/developers')
def developers():
	return render_template('developers.html', title='Meet our Developers')

@app.route('/article')
def article():
	title = request.args.get('title', None)
	cur.execute("select filename from articles where title = '{title}'".format(title=title))
	filename = cur.fetchall()
	if not filename:
		flash('This article does not exist')
	file = os.path.join(app.static_folder, 'archive/articles/{0}'.format(filename[0][0]))
	with open(file, 'r') as f:
		data = f.read()

	return render_template('article.html', title=title, article=data)

@app.route('/articles')
def articles():
	articles = []
	cur.execute('select title from articles')
	articleList = cur.fetchall()
	if not articleList:
		flash('No articles available yet')

	articles = sorted([each_article[0] for each_article in articleList])

	return render_template('articles.html', title='Articles', articles=articles)

@app.route('/ebooks')
def ebooks():
	cur.execute('select * from ebooks')
	bookList = cur.fetchall()
	if not bookList:
		flash('No ebooks available yet')
	ebooks = sorted(bookList, key=lambda x: x[1])
	return render_template('ebooks.html', title='Ebooks', ebooks=ebooks)