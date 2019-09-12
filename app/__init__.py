from flask import Flask
from flask_restful import Resource, Api

## Add SQL Alchemy initialization and Flask config


class Status(Resource):
    def get(self):
        return {'status': 'ok'}

def create_app():
    app = Flask(__name__)
    api = Api(app=app)
    api.add_resource(Status, '/status')
    return app
