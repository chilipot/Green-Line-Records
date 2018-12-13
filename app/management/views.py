from flask import abort, flash, redirect, render_template, url_for
from flask_login import current_user, login_required

from . import management
from .forms import ProjectForm
from .. import db
from ..models import Project

def is_Member_Role(role_id):
    name = Role.query.get(role_id).name
    return name == 'Member' or name == 'Null' or name == None


def check_access():
    """
    Prevent Non-members from acessing the page
    """
    if is_Member_Role(current_user.role_id):
        abort(403)

@management.route('/projects', methods=['GET', 'POST'])
@login_required
def list_projects():
    """
    Render the projects template on the / projects route
    """
    check_access()

    projects = Project.query.all()

    return render_template('management/projects/projects.html',
                            projects=projects, title="Projects")
