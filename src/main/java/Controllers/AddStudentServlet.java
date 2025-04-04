package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.StudentDAO;
import Model.Student;

/**
 * Servlet implementation class AddStudentServlet
 */
@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Retrieve form data
        String name = request.getParameter("name");
        String rollNumber = request.getParameter("rollNumber");
        String grade = request.getParameter("grade");
        int age = Integer.parseInt(request.getParameter("age"));

        // Create a new student object
        Student student = new Student();
        student.setName(name);
        student.setRollNumber(rollNumber);
        student.setGrade(grade);
        student.setAge(age);

        // Insert student into database
        try {
            StudentDAO.insertStudent(student);
            response.sendRedirect("students-list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().append("Error: ").append(e.getMessage());
        }
	}

}
