from flask_wtf import FlaskForm, Form
from wtforms import StringField, SubmitField, SelectField, DateField,\
                    FieldList, FormField, TextField, SelectMultipleField, TimeField
from wtforms.widgets import ListWidget, CheckboxInput
from wtforms.validators import DataRequired, Required, URL
from wtforms.ext.sqlalchemy.fields import QuerySelectField, QuerySelectMultipleField

from ..models import Employee, Project, Genre, Artist, Event, Location, Role


class MultiCheckboxField(SelectMultipleField):
    """
    A multiple-select, except displays a list of checkboxes.

    Iterating the field will produce subfields, allowing custom rendering of
    the enclosed checkbox fields.
    """
    widget = ListWidget(prefix_label=False)
    option_widget = CheckboxInput()

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
                                      get_label="username")
    list = [(g.id, g.name) for g in Genre.query.all()]
    genres = MultiCheckboxField('Genres', choices=list, coerce=int)
    submit = SubmitField('Submit')

class ProjectReleaseForm(FlaskForm):
    """
    Form to release a project
    """

    date = DateField('Date', validators=[DataRequired()], format='%Y-%m-%d')
    url = FieldList(StringField(validators=[URL()]), min_entries=3, max_entries=3)
    submit = SubmitField('Submit')

class GenreForm(FlaskForm):
    """
    Form to add a Genre
    """

    name = StringField(validators=[DataRequired()])
    submit = SubmitField('Submit')

class ArtistForm(FlaskForm):
    """
    Form to add an Artist
    """

    name = StringField('Name', validators=[DataRequired()])
    submit = SubmitField('Submit')

class AssignProjectForm(FlaskForm):
    """
    Assigns an artist to a project
    """

    projects = QuerySelectField(query_factory=lambda: Project.query.all(),
                                get_label="title")
    submit = SubmitField('Submit')

class EventForm(FlaskForm):
    """
    Form to add an Event
    """

    date = DateField('Date', validators=[DataRequired()], format='%Y-%m-%d')
    time = TimeField('Time')
    title = StringField('Title', validators=[DataRequired()])
    description = StringField('Description')
    location = QuerySelectField(query_factory=lambda: Location.query.all(),
                                get_label="name")
    submit = SubmitField('Submit')

class AddEventArtistForm(FlaskForm):
    """
    Form to add an artist to an event
    """

    artist = QuerySelectField(query_factory=lambda: Artist.query.all(),
                              get_label="name")
    submit = SubmitField('Submit')

class LocationForm(FlaskForm):
    """
    Form to add a location
    """

    name = StringField(validators=[DataRequired()])
    submit = SubmitField('Submit')

class LiveRecordingForm(FlaskForm):
    """
    Form to add a live recording
    """

    date = DateField('Date', validators=[DataRequired()], format='%Y-%m-%d')
    time = TimeField('Time')
    location = QuerySelectField(query_factory=lambda: Location.query.all(),
                                get_label="name")
    engineers = QuerySelectMultipleField(query_factory=lambda: Employee.query.join(Role, (Role.id==Employee.role_id)).filter(Role.name.endswith('Engineer')).all(),
                                        get_label="username")
    submit = SubmitField('Submit')
