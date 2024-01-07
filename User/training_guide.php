<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training Guide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
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
    <?php
    require "db_conn.php";
    session_start();
    if (isset($_SESSION['username'])) {
        $username = $_SESSION['username'];

        if (isset($_POST['btn_training'])) {
            $training_name = $_POST['training_name'];
            $training_link = $_POST['traning_link'];

            $insert = mysqli_query($conn, "INSERT INTO training_guide values ('', '$training_name', '$training_link')");
            if ($insert) {
                echo "<script>alert('Done');</script>";
            } else {
                echo "<script>alert('Error in inserting');</script>";
            }
        }
    ?>

    <div id="wrapper" class="d-flex">

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
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper" class="d-flex flex-column">
            <div class="container-fluid">
                <div class="card text-center" style="width: 400px;">
                    <div class="card-body">
                        <h3 class="card-title">Upload Training Guide</h3>
                        <form action="" method="post">
                            <label for="training_name">Workout Name: </label>
                            <input type="text" name="training_name" id="training_name" class="form-control" required><br>
                            <label for="traning_link">Workout Video Link: </label>
                            <input type="text" name="traning_link" id="traning_link" class="form-control" required><br>
                            <button type="submit" name="btn_training" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
                <!-- Second content (table) -->
                <table id="userTable">
                    <thead>
                        <tr>
                            <th>Training ID</th>
                            <th>Workout Name</th>
                            <th>Workout guide Video</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include('db_conn.php');

                        $sql = "SELECT * FROM training_guide";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>";
                                echo "<td>" . $row['training_id'] . "</td>";
                                echo "<td>" . $row['training_name'] . "</td>";
                                echo "<td>" . $row['training_video_link'] . "</td>";
                                echo "<td>";
                                echo "<button class='edit-btn' data-id='" . $row['training_id'] . "'>Edit</button>";
                                echo "<button class='delete-btn' data-id='" . $row['training_id'] . "'>Delete</button>";
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

    <!-- Your existing scripts... -->

    <?php
    } else {
        echo "You need to log in";
        header('Refresh:2; URL=index.html');
    }
    ?>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-ZvpUoO/+PpLXR1lu4jmpXWu80pZlYUAfxl5
