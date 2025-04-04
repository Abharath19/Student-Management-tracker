<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Student"%>
<%@page import="Database.StudentDAO"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <header class="bg-primary text-white py-3">
        <div class="container">
            <h1 class="display-4">Student Management System</h1>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
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
        <h2>All Students</h2>
        <!-- Search Form -->
        <form method="get" action="students-list.jsp" class="form-inline mb-4">
            <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search by name, roll number, or grade" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <% 
            String searchQuery = request.getParameter("search");
            StudentDAO dao = new StudentDAO();
            ArrayList<Student> studentList = (searchQuery == null || searchQuery.isEmpty()) ? dao.getStudents() : dao.searchStudents(searchQuery);
            if (studentList != null && !studentList.isEmpty()) {
        %>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Roll Number</th>
                    <th>Grade</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Student student : studentList) { %>
                    <tr>
                        <td><%= student.getId() %></td>
                        <td><%= student.getName() %></td>
                        <td><%= student.getRollNumber() %></td>
                        <td><%= student.getGrade() %></td>
                        <td><%= student.getAge() %></td>
                        <td>
                            <a href="#" class="text-primary" data-toggle="modal" data-target="#editStudentModal" 
                               data-id="<%= student.getId() %>" data-name="<%= student.getName() %>"
                               data-rollnumber="<%= student.getRollNumber() %>" data-grade="<%= student.getGrade() %>"
                               data-age="<%= student.getAge() %>">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="DeleteStudentServlet?id=<%= student.getId() %>" class="text-danger" onclick="return confirm('Are you sure you want to delete this student?');">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <% 
            } else { 
        %>
            <p class="text-center">No students found.</p>
        <% 
            } 
        %>
    </main>

    <!-- Edit Student Modal -->
    <div class="modal fade" id="editStudentModal" tabindex="-1" role="dialog" aria-labelledby="editStudentModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editStudentModalLabel">Edit Student</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="EditStudentServlet" method="post">
                        <input type="hidden" id="edit-id" name="id">
                        <div class="form-group">
                            <label for="edit-name">Name</label>
                            <input type="text" class="form-control" id="edit-name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-rollnumber">Roll Number</label>
                            <input type="text" class="form-control" id="edit-rollnumber" name="rollNumber" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-grade">Grade</label>
                            <input type="text" class="form-control" id="edit-grade" name="grade" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-age">Age</label>
                            <input type="number" class="form-control" id="edit-age" name="age" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <p>&copy; Goutham H A 2024 Student Management System. All rights reserved.</p>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $('#editStudentModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var id = button.data('id');
            var name = button.data('name');
            var rollNumber = button.data('rollnumber');
            var grade = button.data('grade');
            var age = button.data('age');

            var modal = $(this);
            modal.find('#edit-id').val(id);
            modal.find('#edit-name').val(name);
            modal.find('#edit-rollnumber').val(rollNumber);
            modal.find('#edit-grade').val(grade);
            modal.find('#edit-age').val(age);
        });
    </script>
</body>
</html>
