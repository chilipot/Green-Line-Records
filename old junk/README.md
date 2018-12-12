# Green-Line-Records
A MySQL database for the Green Line Records club to hold data relevant to artists, records, and other. 


<h2>Details</h2>
This is a database project for CS 3200 Database Design that is also being built for the Green Line Records Club at Northeastern University.
The database uses MySQL as its DBMS and the API is build using Node.JS and Express. Public access is given read only permissions while
Green Line Records will be allowed read/write access.


<h2>Green Line Records API References</h2>
The API endpoints are built on a need-to-be basis with the inclusion of some basic common endpoints. 
If an endpoint is needed for greater data access or increased efficiency, please either commit it yourself and add a pull request or post an issue.
This API is allowed to be used by any member of the public for non-commercial usage and access is read only.

<h3>Table Access</h3>
These are general SQL queries to get data access from each table in the database.

<h4>Live Sessions</h4>
<pre><code>https://&lt;host&gt;/live_recording <b>=></b> SELECT * FROM live_recording;</code></pre>
Returns the table rows without any special formating or additional data.

<pre><code>https://&lt;host&gt;/live_recording/id/{live_recording_id} <b>=></b> SELECT * FROM live_recording where live_recording_id={live_recording_id};</code></pre>
Returns the row correspoding to the given PRIMARY_KEY.

<h3>Advanced Queries</h3>
