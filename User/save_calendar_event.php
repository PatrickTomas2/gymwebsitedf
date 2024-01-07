<?php                
require 'db_conn.php'; 
session_start();

    if (isset($_SESSION['username'])) {
        $username = $_SESSION['username'];

        $select_userID_schedule = "SELECT userID FROM user_info WHERE username='$username'";
        $resultUserID = mysqli_query($conn, $select_userID_schedule);
        if ($resultUserID) {
            if (mysqli_num_rows($resultUserID) > 0) {
                $row = mysqli_fetch_assoc($resultUserID);
                $userID = $row['userID'];
            }
        }

        $event_name = $_POST['event_name'];
        $event_start_date = date("y-m-d", strtotime($_POST['event_start_date'])); 
        $event_end_date = date("y-m-d", strtotime($_POST['event_end_date'])); 
                    
        $insert_query = "insert into calendar values ('', $userID, '$event_name', '$event_start_date', '$event_end_date')";             
        if(mysqli_query($conn, $insert_query))
        {
            $data = array(
                        'status' => true,
                        'msg' => 'Event added successfully!'
                    );
        }
        else
        {
            $data = array(
                        'status' => false,
                        'msg' => 'Sorry, Event not added.'				
                    );
        }
        echo json_encode($data);
        } else {
            echo "You need to log in";
            header('Refresh:2; URL=index.html');
        }
?>
