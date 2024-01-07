<?php
// Include your database connection file
require "db_conn.php";
session_start();

if (isset($_SESSION['username'])) {
    $sessionUsername = $_SESSION['username']; // Use a different variable name
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve data from the POST request
        $username = $_POST['username'];
        $membershipType = $_POST['membershipType'];
        $membershipFee = $_POST['membershipFee'];

        // Get the user ID from the session username
        $select_userID = "SELECT userID FROM user_info WHERE username='$sessionUsername'";
        $resultUserID = mysqli_query($conn, $select_userID);

        if ($resultUserID && mysqli_num_rows($resultUserID) > 0) {
            $row = mysqli_fetch_assoc($resultUserID);
            $userID = $row['userID'];

            // Calculate the end date based on the membership type
            switch ($membershipType) {
                case 'semi-monthly':
                    $endDate = date('Y-m-d', strtotime('+15 days'));
                    break;
                case 'monthly':
                    $endDate = date('Y-m-d', strtotime('+1 month'));
                    break;
                case 'annual':
                    $endDate = date('Y-m-d', strtotime('+1 year'));
                    break;
                default:
                    // Handle error or set a default end date
                    $endDate = date('Y-m-d', strtotime('+1 month'));
            }

            // Insert user membership information into the database
            $insertMembership = "INSERT INTO membership (userID, start_date, end_date, membership_type, membership_fee) 
                                VALUES ($userID, NOW(), '$endDate', '$membershipType', $membershipFee)";

            if (mysqli_query($conn, $insertMembership)) {
                echo 'User information inserted into the database successfully.';
            } else {
                echo 'Error inserting user information into the database: ' . mysqli_error($conn);
            }
        } else {
            echo 'Error retrieving user ID from the database.';
        }
    } else {
        echo 'Invalid request.';
    }
} else {
    echo "You need to log in";
    header('Refresh:2; URL=index.html');
}
?>
