API Code Explanation

The API is implemented with Node.JS and Express. It consists of 7 unique routes to represent the 7 tables that are currently implemented. Each route is about to handle the following 4 endpoints : return entire table, return entry matching ID, return entries matching a given string, and lastly deleting an entry with the given ID.

The main file is located in 'bin/www' and setups the server for the application and then delegates to the 'app.js' file. The 'app.js' file will setup the database connection and connect all the routes to the server.

ADDITIONAL THOUGHTS :
Node.JS would've been capable of also rendering the HTML and handling all the event and dynamic data that would occur. As such, I probably could've combined the Front End and the API into a single application, allowing for the condensing of the files and letting them to share a single domain and host; This could be further improved by also including the database host.

OTHER :
Since this is just an API, the views and public files are irrelevant and were simply used for development and setup purposes and then removed from production.
