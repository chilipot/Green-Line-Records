from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
import sqlalchemy

from app import db, login_manager

# USER CONTROL

class Employee(UserMixin, db.Model):
    """
    Create an Employee table
    """

    # Ensures table will be named in plural and not in singular
    # as is the name of the model
    __tablename__ = 'employees'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(60), index=True, unique=True)
    username = db.Column(db.String(60), index=True, unique=True)
    first_name = db.Column(db.String(60), index=True)
    last_name = db.Column(db.String(60), index=True)
    password_hash = db.Column(db.String(128))
    department_id = db.Column(db.Integer, db.ForeignKey('departments.id'))
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    is_admin = db.Column(db.Boolean, default=False)
    representative = db.relationship('Project', backref='employees',
                                     lazy='dynamic')

    @property
    def password(self):
        """
        Prevent pasword from being accessed
        """
        raise AttributeError('password is not a readable attribute.')

    @password.setter
    def password(self, password):
        """
        Set password to a hashed password
        """
        self.password_hash = generate_password_hash(password)

    def verify_password(self, password):
        """
        Check if hashed password matches actual password
        """
        return check_password_hash(self.password_hash, password)

    def __repr__(self):
        return '<Employee: {}>'.format(self.username)


# Set up user_loader
@login_manager.user_loader
def load_user(user_id):
    return Employee.query.get(int(user_id))


class Department(db.Model):
    """
    Create a Department table
    """

    __tablename__ = 'departments'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(60), unique=True)
    description = db.Column(db.String(200))
    employees = db.relationship('Employee', backref='Department',
                                lazy='dynamic')

    def __repr__(self):
        return '<Department: {}>'.format(self.name)


class Role(db.Model):
    """
    Create a Role table
    """

    __tablename__ = 'roles'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(60), unique=True)
    description = db.Column(db.String(200))
    employees = db.relationship('Employee', backref='roles',
                                lazy='dynamic')

    def __repr__(self):
        return '<Role: {}>'.format(self.name)

# Project

marketing = db.Table('marketing',
                     db.Column('project_id', db.Integer, db.ForeignKey('projects.id'), primary_key=True),
                     db.Column('employee_id', db.Integer, db.ForeignKey('employees.id'), primary_key=True))

recording = db.Table('recording',
                     db.Column('project_id', db.Integer, db.ForeignKey('projects.id'), primary_key=True),
                     db.Column('employee_id', db.Integer, db.ForeignKey('employees.id'), primary_key=True))

has_genre = db.Table('has_genre',
                     db.Column('project_id', db.Integer, db.ForeignKey('projects.id'), primary_key=True),
                     db.Column('genre_id', db.Integer, db.ForeignKey('genres.id'), primary_key=True))

works = db.Table('works',
                 db.Column('project_id', db.Integer, db.ForeignKey('projects.id'), primary_key=True),
                 db.Column('artist_id', db.Integer, db.ForeignKey('artists.id'), primary_key=True))

booking = db.Table('booking',
                 db.Column('artist_id', db.Integer, db.ForeignKey('artists.id'), primary_key=True),
                 db.Column('event_id', db.Integer, db.ForeignKey('events.id'), primary_key=True))

live_recording = db.Table('live_recording',
                          db.Column('liverecording_id', db.Integer,
                                    db.ForeignKey('liverecordings.id'), primary_key=True),
                          db.Column('employee_id', db.Integer,
                                    db.ForeignKey('employees.id'), primary_key=True))


class Project(db.Model):
    """
    Create a Project table
    """

    __tablename__ = 'projects'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100))
    type = db.Column(db.Enum('Single', 'EP', 'Album', 'Video', 'Other'))
    status = db.Column(db.Enum('Unconfirmed', 'Confirmed', 'Scheduled',
                               'In-Progress','Completed', 'On-Hold',
                               'Cancelled', 'Released'))
    rep_id = db.Column(db.Integer, db.ForeignKey('employees.id'), nullable=True)
    release = db.relationship('Release', backref='release_projects', lazy='dynamic')
    marketers = db.relationship('Employee', secondary=marketing, lazy='subquery',
                                backref='marketer_projects')
    engineers = db.relationship('Employee', secondary=recording, lazy='subquery',
                                backref='engineer_projects')
    genres = db.relationship('Genre', secondary=has_genre, lazy='subquery',
                             backref='genre_projects')
    artists = db.relationship('Artist', secondary=works, lazy='subquery',
                              backref='artist_projects')

    def __repr__(self):
        return '<Project: {}>'.format(self.name)

class Release(db.Model):
    """
    Create a Release table
    """

    __tablename__ = 'releases'

    id = db.Column(db.Integer, primary_key=True)
    project_id = db.Column(db.Integer, db.ForeignKey('projects.id'), nullable=False)
    links = db.relationship('Link', backref='link_releases', lazy='dynamic')

    def __repr__(self):
        return '<Release {}>'.format(self.name)

# Attributes

class Link(db.Model):
    """
    Create a Link Table
    """

    __tablename__ = 'links'

    id = db.Column(db.Integer, primary_key=True)
    url = db.Column(db.String(300))
    type = db.Column(db.Enum('Bandcamp', 'Soundcloud', 'Spotify', 'Apple Music',
                             'Tidal','Pandora', 'YouTube', 'Google Play',
                             'Amazon Music', 'Other'), nullable=False)
    release_id = db.Column(db.Integer, db.ForeignKey('releases.id'))

    def __repr__(self):
        return '<Link {}>'.format(self.name)

class Genre(db.Model):
    """
    Create a Genre table
    """

    __tablename__ = 'genres'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))

    def __repr__(self):
        return '<Genre {}>'.format(self.name)

# Artists

class Artist(db.Model):
    """
    Create a Artist table
    """

    __tablename__ = 'artists'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    projects = db.relationship('Project', secondary=works, lazy='subquery',
                               backref='project_artists')
    events = db.relationship('Event', secondary=booking, lazy='subquery',
                             backref='event_artists')

    def __repr__(self):
        return '<Artist {}>'.format(self.name)

class Event(db.Model):
    """
    Create an Event table
    """

    __tablename__ = 'events'

    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.DateTime)
    title = db.Column(db.String(100))
    description = db.Column(db.String(255))
    artists = db.relationship('Artist', secondary=booking, lazy='subquery',
                              backref='artist_events')

    def __repr__(self):
        return '<Event {}>'.format(self.name)


# Recording

class LiveRecording(db.Model):
    """
    Create a Live Session table
    """

    __tablename__ = 'liverecordings'

    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.DateTime)
    location_id = db.Column(db.Integer, db.ForeignKey('locations.id'))
    engineers = db.relationship('Employee', secondary=live_recording,
                                lazy='subquery',
                                backref='engineer_liverecordings')

    def __repr__(self):
        return '<Live Recording {}>'.format(self.name)

class Location(db.Model):
    """
    Create a Location table
    """

    __tablename__ = 'locations'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(75))

    def __repr__(self):
        return '<Location {}>'.format(self.name)
