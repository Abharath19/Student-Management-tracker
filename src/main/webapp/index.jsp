<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <style>
        .school-image {
            width: 600px;
            height: 400px;
        }
        img{
    display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;

        }
    </style>
</head>
<body>
    <header class="bg-primary text-white py-3">
        <div class="container">
            <h1 class="display-4"><marquee>Student Management System</marquee></h1>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="students-list.jsp">View All Students</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addStudents.jsp">Add New Student</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <main role="main" class="container my-4">
        <h2>Welcome to the Student Management System</h2>
        <p>This system allows you to manage student records. You can view the list of all students and add new students using the navigation links above.</p>
    </main>
    <section>
   
        <img alt="School Image"  src="http://vignette1.wikia.nocookie.net/doraemon/images/e/ee/School.PNG/revision/latest?cb=20150203135220&path-prefix=en" class="school-image">
    </section>
    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <p>&copy; Goutham H A 2024 Student Management System. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
