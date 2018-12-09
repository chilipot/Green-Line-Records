<?php
header('Location: ' . $_SERVER['HTTP_REFERER']);
$servername = "database-design.clxfur70m41w.us-east-1.rds.amazonaws.com";
$username = "awsroot";
$password = "charlesstein";
$dbname = "green_line_records";
$table = $_POST['table'];

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    switch ($table) {
      case 'location':
        $id = $_POST['ID'];
        $location_name = $_POST['Location'];
        $transaction = $_POST['transaction'];
        switch ($transaction) {
          case 'update':
            $sql = "update $table set location_name='$location_name' where location_id=$id;";
            break;
          case 'insert':
            $sql = "insert into $table(location_name) values ('$location_name');";
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
      case 'live_recording':
        $id = $_POST['ID'];
        $show_name = $_POST['Name'];
        $date = $_POST['Date'];
        $start_time = $_POST['Start'];
        $end_time = $_POST['End'];
        $location_id = $_POST['Location'];
        $transaction = $_POST['transaction'];

        $convert = "select convert_string_to_pk('location', '$location_id') as 'pk';";
        // Prepare statement
        $stmt = $conn->prepare($convert);

        $stmt->execute();

        // execute the query
        $location_id = $stmt->fetchColumn();

        switch ($transaction) {
          case 'update':
            $sql = "update $table set show_name='$show_name', date='$date', start_time='$start_time', end_time='$end_time', location_id='$location_id' where live_recording_id=$id;";
            break;
          case 'insert':
            $sql = "insert into $table(show_name, date, start_time, end_time, location_id) values ('$show_name', '$date', '$start_time', '$end_time', '$location_id');";
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
      case 'artist':
        $id = $_POST['ID'];
        $artist_name = $_POST['Name'];
        $transaction = $_POST['transaction'];
        switch ($transaction) {
          case 'update':
            $sql = "update $table set artist_name='$artist_name' where artist_id=$id;";
            break;
          case 'insert':
            $sql = "insert into $table(artist_name) values ('$artist_name');";
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
      case 'club_member':
        $id = $_POST['ID'];
        $email = $_POST['Email'];
        $last = $_POST['Last'];
        $first = $_POST['First'];
        $transaction = $_POST['transaction'];
        switch ($transaction) {
          case 'update':
            $sql = "update $table set email='$email', lastname='$last', firstname='$first' where member_id=$id;";
            break;
          case 'insert':
            $sql = "insert into $table(email, lastname, firstname) values ('$email', '$last', '$first');";
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
      case 'project':
        $id = $_POST['ID'];
        $title = $_POST['Title'];
        $type = $_POST['Type'];
        $status = $_POST['Status'];
        $rep = $_POST['Rep'];
        $transaction = $_POST['transaction'];

        $convert = "select convert_string_to_pk('club_member', '$rep') as 'pk';";
        // Prepare statement
        $stmt = $conn->prepare($convert);

        $stmt->execute();

        // execute the query
        $rep = $stmt->fetchColumn();

        switch ($transaction) {
          case 'update':
            if ($rep == 'null') {
              $sql = "update $table set title='$title', type='$type', status='$status' where project_id=$id;";
            }
            else {
              $sql = "update $table set title='$title', type='$type', status='$status', rep_id='$rep' where project_id=$id";
            }
            break;
          case 'insert':
            if ($rep == '') {
              $sql = "insert into $table(title, type, status) values ('$title', '$type', '$status');";
            }
            else {
              $sql = "insert into $table(title, type, status, rep_id) values ('$title', '$type', '$status', '$rep');";
            }
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
      case 'release':
        $id = $_POST['ID'];
        $project_id = $_POST['Project'];
        $link_val = $_POST['Link'];
        $release = $_POST['Date'];
        $transaction = $_POST['transaction'];

        $convert = "select convert_string_to_pk('project', '$project_id') as 'pk';";
        // Prepare statement
        $stmt = $conn->prepare($convert);

        $stmt->execute();

        // execute the query
        $location_id = $stmt->fetchColumn();

        $convert = "select convert_string_to_pk('link', '$link_val') as 'pk';";
        // Prepare statement
        $stmt = $conn->prepare($convert);

        $stmt->execute();

        // execute the query
        $link_id = $stmt->fetchColumn();

        $update_link = "update `link` set url='$link_val' where link_id='$link_id';";

        $stmt = $conn->prepare($update_link);
        $stmt->execute();

        switch ($transaction) {
          case 'update':
            $sql = "update `$table` set project_id='$project_id', release_date='$release' where release_id=$id;";
            break;
          case 'insert':
            $sql = "insert into `$table`(project_id, release_date) values ('$project_id', '$release');";
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
      break;
      case 'event':
        $id = $_POST['ID'];
        $date = $_POST['Date'];
        $title = $_POST['Title'];
        $desc = $_POST['Description'];
        $turnout = $_POST['Turnout'];
        $transaction = $_POST['transaction'];
        switch ($transaction) {
          case 'update':
            $sql = "update `$table` set date='$date', title='$title', description='$desc', turnout='$turnout' where event_id=$id;";
            break;
          case 'insert':
            $sql = "insert into `$table`(date, title, description, turnout) values ('$date', '$title', '$desc', '$turnout');";
            break;
          default:
            throw new \Exception("Error Processing Request", 1);
            break;
        }
      break;
  }


    echo $sql;

    // Prepare statement
    $stmt = $conn->prepare($sql);

    // execute the query
    $stmt->execute();

    // echo a message to say the UPDATE succeeded
    echo $stmt->rowCount() . " records successfully executed";
    }
catch(PDOException $e)
    {
    echo $e->getMessage();
    }

$conn = null;
?>
