# Student-Management-tracker
Student Management Tracker is a Java web app using JSP, Servlets, and JDBC to manage student records. It supports adding, viewing, editing, and deleting data with a MySQL database. Built on MVC architecture, it's perfect for learning full-stack Java development with CRUD operations.

## Student Management Tracker

This is a full-stack Java project for managing student information using JSP, Servlet, and JDBC. The application follows the MVC architecture and allows users to perform CRUD operations on student records.

### Features

- **Add Student**: Add new student records to the system.
- **Edit Student**: Update existing student information.
- **Delete Student**: Remove student records from the system.
- **View Students**: Display all student records in a list.

### Technologies Used

- **Java**
- **JSP (JavaServer Pages)**
- **Servlets**
- **JDBC (Java Database Connectivity)**
- **MySQL Database**

### Prerequisites

- JDK 8 or higher
- Apache Tomcat 8 or higher
- MySQL Database

### Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/student-management-tracker.git
   cd student-management-tracker
   ```

2. **Configure Database**

   - Create a MySQL database named `studentmanagement`.
   - Execute the SQL script `studentmanagement.sql` to create the `students` table.

   ```sql
   CREATE DATABASE studentmanagement;
   USE studentmanagement;

   CREATE TABLE students (
       rollNumber INT PRIMARY KEY,
       name VARCHAR(100),
       grade VARCHAR(10),
       email VARCHAR(100)
   );
   ```

3. **Configure Database Connection**

   - Edit the `context.xml` file located in `src/main/webapp/META-INF/` to match your MySQL database credentials.

   ```xml
   <Context>
       <Resource name="jdbc/student_db" auth="Container" type="javax.sql.DataSource"
                 maxActive="100" maxIdle="30" maxWait="10000"
                 username="your_db_username" password="your_db_password"
                 driverClassName="com.mysql.cj.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/studentmanagement"/>
   </Context>
   ```

4. **Deploy the Application**

   - Deploy the application to your Apache Tomcat server.

5. **Run the Application**

   - Access the application in your web browser at `http://localhost:8080/student-management-tracker`.

### Folder Structure

- **/src**: Contains the Java source files.
- **/src/main/webapp**: Contains the JSP files and web-related resources.

### Contributing

Contributions are welcome! Please open an issue or submit a pull request with your changes.

---

Let me know if you'd like me to generate a `README.md` file out of this!
