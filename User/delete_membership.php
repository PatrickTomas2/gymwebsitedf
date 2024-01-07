<?php
require "db_conn.php";
session_start();

if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];

    // Perform the delete query
    $delete_member = mysqli_query($conn, "DELETE membership FROM membership INNER JOIN user_info ON membership.userID=user_info.userID WHERE user_info.username='$username'");

    if ($delete_member) {
        // Send a success response
        http_response_code(200);
        echo "Membership deleted successfully";
    } else {
        // Send an error response
        http_response_code(500);
        echo "Error deleting membership";
    }
} else {
    // Send an unauthorized response
    http_response_code(401);
    echo "Unauthorized access";
}
?>
