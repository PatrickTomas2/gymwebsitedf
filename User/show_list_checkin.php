<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/html5-qrcode@2.0.8/dist/html5-qrcode.min.js"></script>


    <title>QR Scan Check in</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <title>See List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            overflow-x: hidden;
        }

        h1 {
            text-align: center;
        }

        #example {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        #example th, #example td {
            text-align: left;
            border: 1px solid #ddd;
            white-space: nowrap; /* Prevent text wrapping in cells */
        }

        #example th {
            background-color: #3498db; /* Header background color - you can change this color */
            color: #fff; /* Text color in the header */
        }

        #example tbody tr:hover {
            background-color: #f5f5f5; /* Hover effect */
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
            padding-top: 50px;
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
        <a href="admin.php" class="list-group-item list-group-item-action">Dashboard
        </a>
        <a href="show_list_checkin.php" class="list-group-item list-group-item-action">Check-ins
        </a>
        <a href="training_guide.php" class="list-group-item list-group-item-action">Training Guide
        </a>
        <a href="manage_accounts.php" class="list-group-item list-group-item-action">Manage User Accounts
        </a>
        <a href="coach_management.php" class="list-group-item list-group-item-action">Coach Management
        </a>
        <a href="logout.php" class="list-group-item list-group-item-action">Logout
        </a>
    </div>
</div>
<!-- /#sidebar-wrapper -->

<!-- Page Content -->
<div id="page-content-wrapper">
    <div class="container-fluid">
<h1>Check-ins</h1>
        <script>
        $(document).ready(function() {
            $('#example').DataTable({
                searching: true,
                lengthChange: true,
                info: true,
                paging: true,
                order: [[0, 'desc']], // Order by Checkin ID descending by default
            });
        });
    </script>

    <?php
        require 'db_conn.php';
    ?>

    <table id="example" class="display">
        <thead>
            <tr>
                <th>Checkin ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Checkin Date and Time</th>
            </tr>
        </thead>
        <tbody>
        <?php
            $select_checkins = mysqli_query($conn, "SELECT checkins.checkinID, user_info.fname, user_info.lname, user_info.username, DATE_FORMAT(checkins.date_checkin, '%m-%d-%Y %h:%i %p') AS formatted_date FROM checkins INNER JOIN user_info ON checkins.userID=user_info.userID ORDER BY checkins.checkinID DESC;");

            if (mysqli_num_rows($select_checkins) > 0) {
                while ($row = mysqli_fetch_assoc($select_checkins)) {
        ?>
                    <tr>
                        <td><?php echo $row['checkinID'] ?></td>
                        <td><?php echo $row['fname'] . " " . $row['lname']?></td>
                        <td><?php echo $row['username'] ?></td>
                        <td><?php echo $row['formatted_date'] ?></td>
                    </tr>
        <?php
                }
            }
        ?>
        </tbody>
    </table>

</div>
<!-- /#page-content-wrapper -->

</div>





    
</body>
</html>
