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

        $display_query = "SELECT calendar.routine_id, calendar.title, calendar.start_event, calendar.end_event FROM calendar INNER JOIN user_info ON calendar.userID=user_info.userID WHERE user_info.userID=$userID;";             
        $results = mysqli_query($conn,$display_query);   
        $count = mysqli_num_rows($results);  
        if($count>0) 
        {
            $data_arr=array();  
            $i=1;
            while($data_row = mysqli_fetch_array($results, MYSQLI_ASSOC))
            {	
            $data_arr[$i]['event_id'] = $data_row['routine_id'];
            $data_arr[$i]['title'] = $data_row['title'];
            $data_arr[$i]['start'] = date("Y-m-d", strtotime($data_row['start_event']));
            $data_arr[$i]['end'] = date("Y-m-d", strtotime($data_row['end_event']));
            $data_arr[$i]['color'] = '#'.substr(uniqid(),-6); // 'green'; pass colour name
            $data_arr[$i]['url'] = 'https://www.shinerweb.com';
            $i++;
            }
            
            $data = array(
                        'status' => true,
                        'msg' => 'successfully!',
                        'data' => $data_arr
                    );
        }
        else
        {
            $data = array(
                        'status' => false,
                        'msg' => 'Error!'				
                    );
        }
        echo json_encode($data);

        } else {
            echo "You need to log in";
            header('Refresh:2; URL=index.html');
        }
?>