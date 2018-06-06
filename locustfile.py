from locust import HttpLocust, TaskSet, task

class MyTaskSet(TaskSet):
    @task(1)
    def index(self):
        self.client.get("/")

    @task(1)
    def mission(self):
        self.client.get("/our-mission")

    @task(1)
    def founders(self):
        self.client.get("/founders")
    
    @task(1)
    def events(self):
        self.client.get("/events")
    
    @task(1)
    def photos(self):
        self.client.get("/photos")
    
    @task(1)
    def videos(self):
        self.client.get("/videos")
    
    @task(1)
    def articles(self):
        self.client.get("/articles")
    
    @task(1)
    def newsletters(self):
        self.client.get("/newsletters")
    
    @task(1)
    def contactUs(self):
        self.client.get("/contact-us")        
    
    @task(1)
    def tweets(self):
        self.client.get("/tweets")                                

class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 3000
    max_wait = 7000