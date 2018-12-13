from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField
from wtforms.validators import DataRequired
from wtforms.ext.sqlalchemy.fields import QuerySelectField

from ..models import Project

class ProjectForm(FlaskForm):
    """
    Form to add a Project
    """

    title = StringField('Title', validators=[DataRequired()])
    type = SelectField("Type", choices=[('Single', 'Single'),
                                        ('EP', 'EP'),
                                        ('Album', 'Album'),
                                        ('Video', 'Video'),
                                        ('Other', 'Other')],
                        validators=[DataRequired()])
    status = SelectField('status', choices=[('Unconfirmed', 'Unconfirmed'),
                                            ('Confirmed', 'Confirmed'),
                                            ('Scheduled', 'Scheduled'),
                                            ('In-Progress', 'In-Progress'),
                                            ('Completed', 'Completed'),
                                            ('On-Hold', 'On Hold'),
                                            ('Cancelled', 'Cancelled'),
                                            ('Released', 'Released')],
                         validators=[DataRequired()])
    representative = QuerySelectField(query_factory=lambda: Employee.query.all(),
                            get_label="name")
    submit = SubmitField('Submit')
