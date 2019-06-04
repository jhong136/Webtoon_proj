package test01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import challengetoon.CEpisodeDAO;
import challengetoon.CEpisodeDTO;

/**
 * Servlet implementation class WhileController4
 */
@WebServlet("/test01_servlet/while.do4")
public class WhileController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WhileController4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/upload");
		// System.out.println("path:"+ path);
		// 결과 ==>
		// path
		// :C:\jspStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\day0412밑에upload

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		//out.println("path :" + path);

		MultipartRequest multi = new MultipartRequest(request, path, "utf-8");

		CEpisodeDTO dto = new CEpisodeDTO();

		dto.setC_code(multi.getParameter("c_code"));
		dto.setC_no(Integer.parseInt(multi.getParameter("no")));
		dto.setC_name(multi.getParameter("name"));
		dto.setC_content(multi.getFilesystemName("content"));

		CEpisodeDAO dao = new CEpisodeDAO();

		dao.addEp(dto);

		RequestDispatcher rd = request.getRequestDispatcher("/home/myPage.jsp");

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
