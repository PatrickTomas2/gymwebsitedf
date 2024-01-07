<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership Form</title>
    <script src="https://www.paypal.com/sdk/js?client-id=ASGpv0UyKgzqNx7PvNfA4LBqklGkF52Ud6WTrV3jyCXv5gExinmi6CPsurPizmBOKhHjRviLJQK5Oi-u"></script>
    <!-- Bootstrap CSS Link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        header {
        background-color: #161a30;
        padding: 15px 0;
        margin-bottom: 30px;
        }
        .container-box {
            margin-top: 30px;
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

        }

        h1 {
            color: #161a30;
        }

        p {
            color: #161a30;
        }

        form {
            margin-top: 20px;
        }

        label {
            color: #161a30;
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        select, input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #161a30;
            color: #fff;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #3498db;
        }
    </style>
    <link rel="stylesheet" href="home.css">
    
    
</head>
<body>
<?php
    require "db_conn.php";
    session_start();
    

    if (isset($_SESSION['username'])) {
        $username = $_SESSION['username'];
    
    $user_info = "SELECT * FROM user_info WHERE username='$username'";
    $result_user_info = mysqli_query($conn, $user_info);
    if ($result_user_info) {
        if (mysqli_num_rows($result_user_info) > 0) {
            $row = mysqli_fetch_assoc($result_user_info);

            $fname = $row['fname'];
            $lname = $row['lname'];
        }
    }
?>
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <h2>Welcome <?php echo $username?></h2>
                    <ul class="nav">
                        <?php
                        $selectToConfirm = "SELECT Count(user_info.username) AS Count FROM user_info INNER JOIN membership ON user_info.userID = membership.userID WHERE username='$username'";
                        $resultToConfirm = mysqli_query($conn, $selectToConfirm);
                        if ($resultToConfirm) {
                            if (mysqli_num_rows($resultToConfirm) > 0) {
                                $row = mysqli_fetch_assoc($resultToConfirm);
                                    if($row['Count'] < 0) {
                                        ?>
                                        <li><a href="membership_form.php">Join membership</a></li>
                                        <?php
                                    }
                                }
                            }
                        ?>
                    </ul>
                <a href="profile_view.php">
                    <div class="profile-avatar">
                        <span><?php echo strtoupper(substr($fname, 0, 1) . substr($lname, 0, 1)) ?></span>
                    </div>
                </a>
                </nav>
            </div>
        </div>
    </div>
</header>

<?php
    $selectToConfirm = "SELECT Count(user_info.username) AS Count FROM user_info INNER JOIN membership ON user_info.userID = membership.userID WHERE username='$username'";
    $resultToConfirm = mysqli_query($conn, $selectToConfirm);
        if ($resultToConfirm) {
            if (mysqli_num_rows($resultToConfirm) > 0) {
                $row = mysqli_fetch_assoc($resultToConfirm);
            if($row['Count'] > 0) {

                $select_member_info = "SELECT user_info.fname, user_info.lname, membership.membership_type, membership.start_date, membership.end_date, membership.membership_fee FROM membership INNER JOIN user_info ON membership.userID=user_info.userID WHERE user_info.username='$username'";
                $result_member_info = mysqli_query($conn, $select_member_info);
                if ($result_member_info) {
                    if (mysqli_num_rows($result_member_info) > 0) {
                        $row = mysqli_fetch_assoc($result_member_info);

                        $fname = $row['fname'];
                        $lname = $row['lname'];
                        $end_date = $row['end_date'];

                        $date = strtotime($end_date);
                        $remaining = $date - time();
                        $days_remaining = floor($remaining / 86400);

                        // Format the date without the time
                        $formatted_date = date("F j, Y", $date);

                        
                    }
                }
            ?>
                <p>You are a member <?php echo $fname . " " . $lname?></p>
                <p><?php echo "There are $days_remaining days left until $formatted_date";?></p>
            <?php
                }else {
            ?>
                
            <div class="container-box">
                <h1>Be Member</h1>
                <p>Become a member with options for semi-monthly at 150, monthly at 300, or annually at 3000. Experience the advantages of membership, including access to training guides and the ability to schedule workouts.</p>
                <form action="" method="POST">
                    <label for="membershipType">Membership Type:</label>
                    <select id="membershipType" name="membershipType" class="form-control" required>
                        <option value="semi-monthly">Semi-monthly</option>
                        <option value="monthly">Monthly</option>
                        <option value="annual">Annual</option>
                    </select>
                    
                    <!-- <label for="start_date">Starting Date:</label>
                    <input type="date" name="start_date" class="form-control">
                    
                    <label for="end_date">Ending Date:</label>
                    <input type="date" name="end_date" class="form-control"> -->
                        
                    <!-- dito lalabas yung pay button dapat -->
                    <!-- <button name="payment" class="btn btn-primary">Pay</button> -->
                    <div id="paypal-button-container"></div>

                </form>
            </div>
        <?php
                }
            }
        }
        ?>


    <script>
        function getMembershipFee() {
            var membershipType = document.getElementById("membershipType").value;
            var membershipFee;

            switch (membershipType) {
                case "semi-monthly":
                    membershipFee = 150;
                    break;
                case "monthly":
                    membershipFee = 300;
                    break;
                case "annual":
                    membershipFee = 3000;
                    break;
                default:
                    membershipFee = 0; // Default value or handle error
            }

            return membershipFee;
        }

        paypal.Buttons({
            createOrder: function (data, actions) {
                var membershipFee = getMembershipFee();

                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: membershipFee.toString()
                        }
                    }]
                });
            },
            style: {
            color: 'blue',
            shape: 'pill',
            },
            disableFunding: 'credit',
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    var username = "<?php echo $username; ?>";
                    var membershipType = document.getElementById("membershipType").value;
                    var membershipFee = getMembershipFee();

                    // Make an AJAX request to insert user information into the database
                    $.ajax({
                        url: 'insert_membership.php', // Replace with the actual server-side script
                        type: 'POST',
                        data: {
                            username: username,
                            membershipType: membershipType,
                            membershipFee: membershipFee
                        },
                        success: function (response) {
                            console.log('User information inserted into the database successfully.');
                            // Optionally, you can redirect the user or perform other actions.
                            window.location.href = 'new_home_screen.php';
                        },
                        error: function (error) {
                            console.error('Error inserting user information into the database: ', error);
                        }
                    });
                });
            }
        }).render('#paypal-button-container');
    </script>


    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<?php
    
    }else {
        echo "You need to log in";
        header('Refresh:2; URL=index.html');
    }
?>
</body>
</html>
