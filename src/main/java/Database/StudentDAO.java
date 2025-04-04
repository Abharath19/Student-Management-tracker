package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Student;

public class StudentDAO {

    // Method to get all students
    public static ArrayList<Student> getStudents() {
        ArrayList<Student> studentList = new ArrayList<>();
        String query = "SELECT * FROM students";
        Connection con = DBConnector.getConnection();
        try (PreparedStatement statement = con.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setRollNumber(rs.getString("rollNumber"));
                student.setGrade(rs.getString("grade"));
                student.setAge(rs.getInt("age"));
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnector.closeConnection(con);
        }
        return studentList;
    }

    // Method to get a student by ID
    public static Student getStudentById(int id) {
        Student student = null;
        String query = "SELECT * FROM students WHERE id = ?";
        Connection con = DBConnector.getConnection();
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    student = new Student();
                    student.setId(rs.getInt("id"));
                    student.setName(rs.getString("name"));
                    student.setRollNumber(rs.getString("rollNumber"));
                    student.setGrade(rs.getString("grade"));
                    student.setAge(rs.getInt("age"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnector.closeConnection(con);
        }
        return student;
    }

    // Method to insert a new student
    public static void insertStudent(Student student) {
        String query = "INSERT INTO students (name, rollNumber, grade, age) VALUES (?, ?, ?, ?)";
        Connection con = DBConnector.getConnection();
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getRollNumber());
            statement.setString(3, student.getGrade());
            statement.setInt(4, student.getAge());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnector.closeConnection(con);
        }
    }

    // Method to update an existing student
    public static void updateStudent(Student student) {
        String query = "UPDATE students SET name = ?, rollNumber = ?, grade = ?, age = ? WHERE id = ?";
        Connection con = DBConnector.getConnection();
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, student.getName());
            statement.setString(2, student.getRollNumber());
            statement.setString(3, student.getGrade());
            statement.setInt(4, student.getAge());
            statement.setInt(5, student.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnector.closeConnection(con);
        }
    }

    // Method to delete a student
    public static int deleteStudent(int id) {
        String query = "DELETE FROM students WHERE id = ?";
        Connection con = DBConnector.getConnection();
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnector.closeConnection(con);
        }
        return 0;
    }
    
    
    //Method to searcg Students
    
    public static ArrayList<Student> searchStudents(String searchQuery) throws SQLException {
        String query = "SELECT * FROM students WHERE name LIKE ? OR rollNumber LIKE ? OR grade LIKE ?";
        Connection con = DBConnector.getConnection();
        ArrayList<Student> studentList = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet rs = null;

        if (con != null) {
            try {
                statement = con.prepareStatement(query);
                String likeQuery = "%" + searchQuery + "%";
                statement.setString(1, likeQuery);
                statement.setString(2, likeQuery);
                statement.setString(3, likeQuery);
                rs = statement.executeQuery();
                while (rs.next()) {
                    Student student = new Student();
                    student.setId(rs.getInt("id"));
                    student.setName(rs.getString("name"));
                    student.setRollNumber(rs.getString("rollNumber"));
                    student.setGrade(rs.getString("grade"));
                    student.setAge(rs.getInt("age"));
                    studentList.add(student);
                }
            } finally {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                DBConnector.closeConnection(con);
            }
        }
        return studentList;
    }


   }
