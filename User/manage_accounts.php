<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage User Accounts</title>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Include DataTables CSS and JS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="ADMINstyles.css">
    <style>
        body {
            overflow-x: hidden;
        }

        #wrapper {
            display: flex;
        }

        #sidebar-wrapper {
            position: fixed;
            width: 250px;
            height: 100%;
            background: #000;
            overflow-y: auto;
            transition: all 0.5s ease;
            padding-top: 20px;
        }

        #sidebar-wrapper .sidebar-heading {
            padding: 10px;
            color: white;
            text-align: center;
        }

        #sidebar-wrapper .list-group {
            padding: 20px;
        }

        #sidebar-wrapper .list-group-item {
            border: none;
            background: #000;
            color: #fff;
            border-radius: 0;
            transition: all 0.3s ease;
        }

        #sidebar-wrapper .list-group-item:hover {
            background: rgba(255, 255, 255, 0.2);
            border-left: 4px solid red;
            color: #fff;
        }

        #page-content-wrapper {
            flex: 1;
            padding-left: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #wrapper.toggled #page-content-wrapper {
            padding-left: 0;
        }

        .fa {
            margin-right: 10px;
        }

        .blog-box {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
            width: 80%;
        }
    </style>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-dark" id="sidebar-wrapper">
            <div class="sidebar-heading">Admin Dashboard</div>
            <div class="list-group">
                <a href="admin.php" class="list-group-item list-group-item-action">Dashboard</a>
                <a href="show_list_checkin.php" class="list-group-item list-group-item-action">Check-ins</a>
                <a href="training_guide.php" class="list-group-item list-group-item-action">Training Guide</a>
                <a href="manage_accounts.php" class="list-group-item list-group-item-action">Manage User Accounts</a>
                <a href="coach_management.php" class="list-group-item list-group-item-action">Coach Management</a>
                <a href="logout.php" class="list-group-item list-group-item-action">Logout</a>
            </div>
        </div>
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container">
                <h2>Manage User Accounts</h2>
                <table id="userTable">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Sex</th>
                            <th>Birthdate</th>
                            <th>Address</th>
                            <th>Phone Number</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include('db_conn.php');

                        $sql = "SELECT * FROM user_info";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>";
                                echo "<td>" . $row['userID'] . "</td>";
                                echo "<td>" . $row['fname'] . "</td>";
                                echo "<td>" . $row['lname'] . "</td>";
                                echo "<td>" . $row['sex'] . "</td>";
                                echo "<td>" . $row['birthdate'] . "</td>";
                                echo "<td>" . $row['address'] . "</td>";
                                echo "<td>" . $row['phoneNumber'] . "</td>";
                                echo "<td>" . $row['username'] . "</td>";
                                echo "<td>" . $row['password'] . "</td>";
                                echo "<td>";
                                echo "<button class='edit-btn' data-id='" . $row['userID'] . "'>Edit</button>";
                                echo "<button class='delete-btn' data-id='" . $row['userID'] . "'>Delete</button>";
                                echo "</td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='10'>No records found</td></tr>";
                        }

                        $conn->close();
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- Include your custom JavaScript file -->
    <!-- <script type="text/javascript" src="script.js"></script> -->
</body>

</html>
