View Code Explanation

The view for this database serves to simply allow access to the Database through some key tables. Its consists of a dynamic web page that uses jQuery and PHP to handle the data.

How To Get Data :

Step 1 - Input request :
Data is requested by selecting a table and pressing ENTER while the input bar is in focus. Valid parameters for the input bar are Strings and Numbers representing any words in the row and the Private Key of the row respectively. The input event is sent to a handler in the class InputControl (line 622) where the method 'handleSubmission()' determines if the user is trying to add and entry or search for and entry. If searching for entries, the request is sent to the class AnalyzeSearch (line 317) to parse the input parameters and determine what table that user is trying to access.

Step 2 - Determine Parameters :
The input string is parsed into parameters and turned into a dictionary with keys 'id', 'date', 'str' where the id is the private key, the date is the date of the entry if relevant, and the str is an array containing any string.

Step 3 - Prepare The Query :
The parameters are sent to the method 'sendQuery()' (line 430) where the parameters are converted into an endpoint of the API. The 'id' parameter takes precedence since it will return an exact entry while the others will try to match values and possibly return many correct entries. If there are no parameters, then the query will grab all entries.

Step 4 - Send The Query :
'dataFetch()' (line 381) will take a url, append it to the host string and send a request to the endpoint. We wait for the response and determine if we have a 200 status code (OK status) and convert it into a JSON object that is then further converted into a JS dictionary.

Step 5 - Display The Table :
Once the response is received, there is a call to the class TableLayouts (line 136) where it takes the dictionary generated in Step 4 and generates a HTML table from it. Method 'getRows()' contains multiple conditions where it tries to parse data that is formatted for the database into a format that is more readable for the user. If the row value matches with a regex value, the value is parsed and reformatted; this currently only occurs for DateTime, Time, and URL values. If the row value is NULL, then we display a 'N/A' instead.

Step 6 - Additional Setup :
A listener is added to each row so that the event of clicking on it will result in a form appearing that can be used to modify or delete the entry.

How To Add Data :

Step 1 - Input Request :
Data is requested by selecting a table and pressing ENTER while the input bar is in focus. No parameters are necessary and any text in the input will be ignored. The input event is sent to a handler in the class InputControl (line 622) where the method 'handleSubmission()' determines if the user is trying to add and entry or search for and entry. If adding an entry, the class FormControl (line 514) is used to display the form for the table with labels for each column.

Step 2 - Continue To 'Posting Data'

Posting Data :

Step 1 - Input Request :
When either the 'submit' button is selected, a request is made to a PHP script to handle the input. The PHP script connected directly to the database and prepares to send a query. Hidden input tags are included to serve as additional data for the PHP file to read; this includes that transaction type and the table.

Step 2 - Table Conditional :
The PHP consists of a multiple level switch statement (YIKES! I know!) that first determines what table is attempting to be modified and then continue onto determining if the user intends to INSERT a new entry or UPDATE and existing one.

Step 3 - Convert Foreign Keys :
Foreign Keys are switched to a string value that is more representative of its data for the user. As such, the form also sends them as this name and we need to convert it back to the ID that it is representing. We call a function in the database to make this conversion. Once converted, the sql statement can be created, prepared, and executed.


SHORTCOMINGS AND LEARNINGS:

PHP is still a great way to template HTML and handle form submissions but in this case I should have had the submission handled by a JS file. First off, I wouldn't have to include hidden input tags to share data about the transaction but instead just pass it on as a parameter in the event handler. Another issue is that I connected directly to the database and completely ignore the API; either connect directly to the database of use an API, I shouldn't be doing both. The reason I did use PHP is because the HTML form automatically submits to a server-side PHP script to handle it and that's what I was used to.

The code is not designed in the most efficient way and some implementations are heavily coupled to another. Ideally, I should have followed a more effective design pattern that will act upon each request as if it were an object and also allow for the request to remain asynchronous.

The view could've used a lot of help by simply adding in a dynamic framework like React or Angular and also including the use of an ORM to better manipulate and access the database tables.
