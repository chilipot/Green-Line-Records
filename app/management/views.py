from flask import abort, flash, redirect, render_template, url_for
from flask_login import current_user, login_required

from . import management
from .forms import ProjectForm
from .. import db
from ..models import Project

@management.route('/projects', methods=['GET', 'POST'])
@login_required
def list_projects():
    """
    Render the projects template on the / projects route
    """

    projects = Project.query.all()

    return render_template('management/projects/projects.html',
                            projects=projects, title="Projects")

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
                          representative=form.representative.data)
        try:
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
        project.representative = form.representative.data
        db.session.commit()
        flash('You have successfully edited the project.')

        return redirect(url_for('management.list_projects'))

    form.representative.data = project.representative
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
