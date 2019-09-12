from flask import abort, flash, redirect, render_template, url_for, request
from flask_login import current_user, login_required
from wtforms import StringField
import datetime

from . import management
from .forms import ProjectForm, ProjectReleaseForm, GenreForm, ArtistForm,\
                   AssignProjectForm, EventForm, AddEventArtistForm,\
                   LocationForm, LiveRecordingForm
from .. import db
from ..models import Project, Release, Employee, Link, Project, Genre,\
                     has_genre, Artist, Event, Location, LiveRecording

@management.route('/projects', methods=['GET', 'POST'])
@login_required
def list_projects():
    """
    Render the projects template on the / projects route
    """

    projects = Project.query.all()

    return render_template('management/projects/projects.html',
                            projects=projects, employee=Employee, title="Projects")

@management.route('/projects/add', methods=['GET','POST'])
@login_required
def add_project():
    """
    Add a project to the database
    """

    add_project = True

    form = ProjectForm()
    if form.validate_on_submit():
        project = Project(title=form.title.data,
                          type=form.type.data,
                          status=form.status.data,
                          rep_id=form.representative.data.id)
        try:
            for id in form.genres.data:
                tag = Genre.query.get(id)
                project.genres.append(tag)
            db.session.add(project)
            db.session.commit()
            print(form.genres)
            flash('You have successfully added a new project')
        except:
            flash('Error: project failed to be added.')

        return redirect(url_for('management.list_projects'))

    return render_template('management/projects/project.html', action="Add",
                           add_project=add_project, checked=None, form=form,
                           title="Add Project")

@management.route('/projects/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_project(id):
    """
    Edit a project
    """

    add_project = False

    project = Project.query.get_or_404(id)
    form = ProjectForm(obj=project)
    if form.validate_on_submit():
        project.title = form.title.data
        project.type = form.type.data
        project.status = form.status.data
        project.rep_id = form.representative.data.id
        for id in project.genres:
            project.genres.pop()
        for id in form.genres.data:
            tag = Genre.query.get(id)
            project.genres.append(tag)
        db.session.commit()
        flash('You have successfully edited the project.')

        return redirect(url_for('management.list_projects'))

    checked = [genre.id for genre in project.genres]
    form.representative.data = project.rep_id
    form.status.data = project.status
    form.type.data = project.type
    form.title.data = project.title
    return render_template('management/projects/project.html', action='Edit',
                           add_project=add_project, form=form,
                           project=project, checked=checked, title="Edit Project")

@management.route('/projects/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_project(id):
    """
    Delete a project from the database
    """

    project = Project.query.get_or_404(id)
    db.session.delete(project)
    db.session.commit()
    flash('You have successfully deleted the project.')

    return redirect(url_for('management.list_projects'))

    return render_template(title="Delete project")


@management.route('/releases', methods=['GET', 'POST'])
@login_required
def list_releases():
    """
    Render the releases template on the / releases route
    """

    releases = Release.query.all()

    return render_template('management/releases/releases.html',
                            releases=releases, project=Project, title="Releases")


@management.route('/projects/release/<int:id>', methods=['GET', 'POST'])
@login_required
def release_project(id):
    """
    Release a project on a specific date with links
    """

    project = Project.query.get_or_404(id)

    form = ProjectReleaseForm(obj=project)

    if form.validate_on_submit():
        release = Release(project_id=project.id,
                          date=form.date.data)
        project.status = 'Released'
        try:
            db.session.add(release)
            db.session.commit()
            for link in form.url.data:
                newLink = Link(url=link,
                               release_id=release.id)
                db.session.add(newLink)
                db.session.commit()
            flash('You have successfully released the project.')
        except:
            flash('Failed to release the project.')

        return redirect(url_for('management.list_projects'))

    return render_template('management/releases/release.html',
                       project=project, links=[None, None, None], form=form, title='Release Project')

@management.route('/releases/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_release(id):
    """
    Edit a release
    """

    add_release = False

    release = Release.query.get_or_404(id)
    links = Link.query.filter_by(release_id=id)
    form = ProjectReleaseForm(obj=release)

    if form.validate_on_submit():
        release.date = form.date.data
        for index in range(len(links.all())):
            links[index].url = form.url.data[index]

        db.session.commit()
        flash('You have successfully edited the release.')

        return redirect(url_for('management.list_releases'))

    return render_template('management/releases/release.html', action='Edit',
                           add_release=add_release, form=form,
                           releases=release, links=links.all(), project=Project, title="Edit Release")

@management.route('/releases/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_release(id):
    """
    Delete a release from the database
    """

    release = Release.query.get_or_404(id)
    project = Project.query.filter_by(id=release.project_id).first()
    project.status = 'Unknown'
    db.session.delete(release)
    db.session.commit()
    flash('You have successfully deleted the release.')

    return redirect(url_for('management.list_releases'))

    return render_template(title="Delete release")

@management.route('/genres', methods=['GET', 'POST'])
@login_required
def list_genres():
    """
    Render the genre template on the / genre route
    """

    genres = Genre.query.all()

    return render_template('management/genres/genres.html',
                            genres=genres, title="Genres")

@management.route('/genres/add', methods=['GET', 'POST'])
@login_required
def add_genre():
    """
    Add a genre
    """

    add_genre = True

    form = GenreForm()
    if form.validate_on_submit():
        genre = Genre(name=form.name.data)
        try:
            db.session.add(genre)
            db.session.commit()
            flash('You have successfully added a new genre')
        except:
            flash('Error: genre failed to be added.')

        return redirect(url_for('management.list_genres'))

    return render_template('management/genres/genre.html', action="Add",
                           add_genre=add_genre, form=form,
                           title="Add Genre")

@management.route('/genres/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_genre(id):
    """
    Edit a genre
    """

    add_genre = False

    genre = Genre.query.get_or_404(id)
    form = GenreForm(obj=genre)
    if form.validate_on_submit():
        genre.name = form.name.data
        db.session.commit()
        flash('You have successfully edited the genre.')

        return redirect(url_for('management.list_genres'))

    form.name.data = genre.name
    return render_template('management/genres/genre.html', action='Edit',
                           add_genre=add_genre, form=form,
                           genre=genre, title="Edit Genre")

@management.route('/genres/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_genre(id):
    """
    Delete a genre from the database
    """

    genre = Genre.query.get_or_404(id)
    db.session.delete(genre)
    db.session.commit()
    flash('You have successfully deleted the genre.')

    return redirect(url_for('management.list_genres'))

    return render_template(title="Delete genre")

@management.route('/artists', methods=['GET', 'POST'])
@login_required
def list_artists():
    """
    Render the artist template on the / artist route
    """

    artists = Artist.query.all()

    return render_template('management/artists/artists.html',
                            artists=artists, title="Artists")

@management.route('/artists/add', methods=['GET', 'POST'])
@login_required
def add_artist():
    """
    Add a artist
    """

    add_artist = True

    form = ArtistForm()
    if form.validate_on_submit():
        artist = Artist(name=form.name.data)
        try:
            db.session.add(artist)
            db.session.commit()
            flash('You have successfully added a new artist')
        except:
            flash('Error: artist failed to be added.')

        return redirect(url_for('management.list_artists'))

    return render_template('management/artists/artist.html', action="Add",
                           add_artist=add_artist, form=form,
                           title="Add Artist")

@management.route('/artists/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_artist(id):
    """
    Edit a artist
    """

    add_artist = False

    artist = Artist.query.get_or_404(id)
    form = ArtistForm(obj=artist)
    if form.validate_on_submit():
        artist.name = form.name.data
        for id in artist.projects:
            artist.projects.pop()
        for id in form.projects.data:
            project = Project.query.get(id)
            artist.projects.append(project)
        db.session.commit()
        flash('You have successfully edited the artist.')

        return redirect(url_for('management.list_artists'))

    form.name.data = artist.name
    return render_template('management/artists/artist.html', action='Edit',
                           add_artist=add_artist, form=form,
                           artist=artist, title="Edit Artist")

@management.route('/artists/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_artist(id):
    """
    Delete a artist from the database
    """

    artist = Artist.query.get_or_404(id)
    db.session.delete(artist)
    db.session.commit()
    flash('You have successfully deleted the artist.')

    return redirect(url_for('management.list_artists'))

    return render_template(title="Delete artist")

@management.route('/artists/project/<int:id>', methods=['GET', 'POST'])
@login_required
def assign_project(id):
    """
    Assign a project to the given artist
    """

    artist = Artist.query.get_or_404(id)

    form = AssignProjectForm(obj=artist)

    if form.validate_on_submit():
        project = Project.query.get(form.projects.data.id)
        print('\n', form.projects.data.id, '\n')
        try:
            artist.projects.append(project)
            db.session.commit()
            flash('You have successfully assigned the project.')
        except:
            flash('Failed to assign the project.')

        return redirect(url_for('management.list_artists'))

    return render_template('management/artists/assign.html',
                       artist=artist, form=form, title="Assign Project")

@management.route('/events', methods=['GET', 'POST'])
@login_required
def list_events():
    """
    Render the event template on the / events route
    """

    events = Event.query.all()

    return render_template('management/events/events.html',
                            events=events, title="Events")

@management.route('/events/add', methods=['GET', 'POST'])
@login_required
def add_event():
    """
    Add a event
    """

    add_event = True

    form = EventForm()
    if form.validate_on_submit():
        event = Event(title=form.title.data,
                      location=form.location.data,
                      date=datetime.datetime.combine(form.date.data, form.time.data),
                      description=form.description.data)
        try:
            db.session.add(event)
            db.session.commit()
            flash('You have successfully added a new event')
        except:
            flash('Error: event failed to be added.')

        return redirect(url_for('management.list_events'))

    return render_template('management/events/event.html', action="Add",
                           add_event=add_event, form=form,
                           title="Add Event")

@management.route('/events/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_event(id):
    """
    Edit a artist
    """

    add_event = False

    event = Event.query.get_or_404(id)
    form = EventForm(obj=event)
    if form.validate_on_submit():
        event.title = form.title.data
        event.location_id = form.location.data.id,
        event.date = datetime.datetime.combine(form.date.data, form.time.data)
        event.description = form.description.data
        db.session.commit()
        flash('You have successfully edited the event.')

        return redirect(url_for('management.list_events'))

    form.description.data = event.description
    form.location.data = event.location_id
    form.date.data = event.date
    form.time.data = event.date
    form.title.data = event.title
    return render_template('management/events/event.html', action='Edit',
                           add_event=add_event, form=form,
                           event=event, title="Edit Event")

@management.route('/events/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_event(id):
    """
    Delete a event from the database
    """

    event = Event.query.get_or_404(id)
    db.session.delete(event)
    db.session.commit()
    flash('You have successfully deleted the event.')

    return redirect(url_for('management.list_events'))

    return render_template(title="Delete event")

@management.route('/events/artist/<int:id>', methods=['GET', 'POST'])
@login_required
def add_event_artist(id):
    """
    Add an artist to an event
    """

    event = Event.query.get_or_404(id)
    form = AddEventArtistForm()
    if form.validate_on_submit():
        artist = Artist.query.get(form.artist.data.id)
        event.artists.append(artist)
        db.session.commit()
        flash('You have successfully added an artist to the event')

        return redirect(url_for('management.list_events'))

    return render_template('management/events/assign.html', form=form, event=event,
                           title="Add Event Artist")

@management.route('/locations', methods=['GET', 'POST'])
@login_required
def list_locations():
    """
    List all locations
    """

    locations = Location.query.all()

    return render_template('management/locations/locations.html',
                            locations=locations, title="Locations")

@management.route('/locations/add', methods=['GET', 'POST'])
@login_required
def add_location():
    """
    Add a location
    """

    add_location = True

    form = LocationForm()
    if form.validate_on_submit():
        location = Location(name=form.name.data)
        try:
            db.session.add(location)
            db.session.commit()
            flash('You have successfully added a new location')
        except:
            flash('Error: location failed to be added.')

        return redirect(url_for('management.list_locations'))

    return render_template('management/locations/location.html', action="Add",
                           add_location=add_location, form=form,
                           title="Add Location")

@management.route('/locations/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_location(id):
    """
    Edit a location
    """

    add_location = False

    location = Location.query.get_or_404(id)
    form = LocationForm(obj=location)
    if form.validate_on_submit():
        location.name = form.name.data
        db.session.commit()
        flash('You have successfully edited the location.')

        return redirect(url_for('management.list_locations'))

    form.name.data = location.name
    return render_template('management/locations/location.html', action='Edit',
                           add_location=add_location, form=form,
                           location=location, title="Edit Location")

@management.route('/locations/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_location(id):
    """
    Delete a location from the database
    """

    location = Location.query.get_or_404(id)
    db.session.delete(location)
    db.session.commit()
    flash('You have successfully deleted the location.')

    return redirect(url_for('management.list_locations'))

    return render_template(title="Delete location")

@management.route('/liverecordings', methods=['GET', 'POST'])
@login_required
def list_liverecordings():
    """
    List all liverecordings
    """

    liverecordings = LiveRecording.query.all()

    return render_template('management/liverecordings/liverecordings.html',
                            liverecordings=liverecordings, title="LiveRecordings")

@management.route('/liverecordings/add', methods=['GET', 'POST'])
@login_required
def add_liverecording():
    """
    Add a liverecording
    """

    add_liverecording = True

    form = LiveRecordingForm()
    if form.validate_on_submit():
        liverecording = LiveRecording(location_id=form.location.data.id,
                                      date=datetime.datetime.combine(form.date.data, form.time.data),
                                      engineers=form.engineers.data)
        try:
            db.session.add(liverecording)
            db.session.commit()
            flash('You have successfully added a new liverecording')
        except:
            flash('Error: liverecording failed to be added.')

        return redirect(url_for('management.list_liverecordings'))

    return render_template('management/liverecordings/liverecording.html', action="Add",
                           add_liverecording=add_liverecording, form=form,
                           title="Add LiveRecording")

@management.route('/liverecordings/edit/<int:id>', methods=['GET', 'POST'])
@login_required
def edit_liverecording(id):
    """
    Edit a liverecording
    """

    add_liverecording = False

    liverecording = LiveRecording.query.get_or_404(id)
    form = LiveRecordingForm(obj=liverecording)
    if form.validate_on_submit():
        liverecording.date = datetime.datetime.combine(form.date.data, form.time.data)
        liverecording.location_id = form.location.data.id
        liverecording.engineers = form.engineers.data
        db.session.commit()
        flash('You have successfully edited the liverecording.')

        return redirect(url_for('management.list_liverecordings'))


    form.date.data = liverecording.date
    form.time.data = liverecording.date
    form.engineers.data = liverecording.engineers
    form.location_id.data = liverecording.location.id
    return render_template('management/liverecordings/liverecording.html', action='Edit',
                           add_liverecording=add_liverecording, form=form,
                           liverecording=liverecording, title="Edit LiveRecording")

@management.route('/liverecordings/delete/<int:id>', methods=['GET', 'POST'])
@login_required
def delete_liverecording(id):
    """
    Delete a liverecording from the database
    """

    liverecording = LiveRecording.query.get_or_404(id)
    db.session.delete(liverecording)
    db.session.commit()
    flash('You have successfully deleted the liverecording.')

    return redirect(url_for('management.list_liverecordings'))

    return render_template(title="Delete liverecording")
