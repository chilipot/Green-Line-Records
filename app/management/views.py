from flask import abort, flash, redirect, render_template, url_for, request
from flask_login import current_user, login_required
from wtforms import StringField

from . import management
from .forms import ProjectForm, ProjectReleaseForm, GenreForm
from .. import db
from ..models import Project, Release, Employee, Link, Project, Genre, has_genre

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
            flash('You have successfully added a new project')
        except:
            flash('Error: project failed to be added.')

        return redirect(url_for('management.list_projects'))

    return render_template('management/projects/project.html', action="Add",
                           add_project=add_project, form=form,
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
        db.session.commit()
        flash('You have successfully edited the project.')

        return redirect(url_for('management.list_projects'))

    form.representative.data = project.rep_id
    form.status.data = project.status
    form.type.data = project.type
    form.title.data = project.title
    return render_template('management/projects/project.html', action='Edit',
                           add_project=add_project, form=form,
                           project=project, title="Edit Project")

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
