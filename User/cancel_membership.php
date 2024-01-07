<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Cancel Membership</title>
</head>
<body>
<?php
    require "db_conn.php";
    session_start();

    if (isset($_SESSION['username'])) {
        $username = $_SESSION['username'];
?>
        <script>
            Swal.fire({
                title: "Are you sure?",
                text: "You want to cancel your membership?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, cancel it!",
                cancelButtonText: "No, keep it"
            }).then((result) => {
                if (result.isConfirmed) {
                    // If user clicks "Yes," make an AJAX request to delete membership
                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                // Success, redirect to profile_view.php
                                window.location.href = "profile_view.php";
                            } else {
                                // Handle error
                                console.error("Error deleting membership");
                            }
                        }
                    };
                    xhr.open("GET", "delete_membership.php", true);
                    xhr.send();
                } else {
                    // If user clicks "No," redirect to profile_view.php
                    window.location.href = "profile_view.php";
                }
            });
        </script>

<?php
    } else {
        echo "You need to log in";
        header('Refresh:2; URL=index.html');
    }
?>
</body>
</html>
