from flask_wtf import FlaskForm, Form
from wtforms import StringField, SubmitField, SelectField, DateField,\
                    FieldList, FormField, TextField, SelectMultipleField
from wtforms.widgets import ListWidget, CheckboxInput
from wtforms.validators import DataRequired, Required, URL
from wtforms.ext.sqlalchemy.fields import QuerySelectField

from ..models import Employee, Project, Genre


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

class TextForm(FlaskForm):
    name = StringField(validators=[URL()])

class ProjectReleaseForm(FlaskForm):
    """
    Form to release a project
    """

    date = DateField('Date', validators=[Required()], format='%Y-%m-%d')
    url = FieldList(StringField(), min_entries=3, max_entries=3)
    submit = SubmitField('Submit')

class GenreForm(FlaskForm):
    name = StringField(validators=[DataRequired()])
    submit = SubmitField('Submit')
