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

import webtoon.TEpisodeDAO;
import webtoon.TEpisodeDTO;

/**
 * Servlet implementation class WhileController2
 */
@WebServlet("/test01_servlet/while.do2")
public class WhileController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WhileController2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getSession().getServletContext().getRealPath("/upload");
		// System.out.println("path:"+ path);
		// 결과 ==>
		// path
		// :C:\jspStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\day0412밑에upload

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		//out.println("path :" + path);

		MultipartRequest multi = new MultipartRequest(request, path, "utf-8");

		TEpisodeDTO dto = new TEpisodeDTO();

		dto.setT_code(multi.getParameter("t_code"));
		dto.setT_no(Integer.parseInt(multi.getParameter("no")));
		dto.setT_name(multi.getParameter("name"));
		dto.setT_content(multi.getFilesystemName("content"));

		TEpisodeDAO dao = new TEpisodeDAO();

		dao.addEp(dto);

		RequestDispatcher rd = request.getRequestDispatcher("/manager/admin.jsp");

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
