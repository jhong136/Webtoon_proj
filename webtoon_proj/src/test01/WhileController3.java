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

import challengetoon.ChallengeToonDAO;
import challengetoon.ChallengeToonDTO;
import reader.ReaderDAO;


/**
 * Servlet implementation class WhileController3
 */
@WebServlet("/test01_servlet/while.do3")
public class WhileController3 extends HttpServlet {
	private static String CODEAL = "b";
	private static int CODENO = 1;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WhileController3() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request.setCharacterEncoding("UTF-8");

		String path = request.getSession().getServletContext().getRealPath("/upload");
		// System.out.println("path:"+ path);
		// 결과 ==>
		// path
		// :C:\jspStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\day0412밑에upload

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		// out.println("path :"+ path);

		MultipartRequest multi = new MultipartRequest(request, path, "utf-8");

		ChallengeToonDTO dto = new ChallengeToonDTO();

		String r_id = multi.getParameter("r_id");
		dto.setC_code(makeCode());
		dto.setC_title(multi.getParameter("title"));
		dto.setC_genre(multi.getParameter("genre"));
		dto.setC_intro(multi.getParameter("intro"));
		dto.setC_img(multi.getFilesystemName("img"));

		ChallengeToonDAO dao = new ChallengeToonDAO();
		ReaderDAO rDao = new ReaderDAO();
		String r_nickname = rDao.getNickname(r_id);
		dto.setR_nickName(r_nickname);

		dao.addCtoon(dto);

		RequestDispatcher rd = request.getRequestDispatcher("/home/myPage.jsp");

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String makeCode() {		
		String code = CODENO + CODEAL;
		CODENO++;
		if (CODENO > 999) {
			CODENO = 1;
			CODEAL = CODEAL + 1;
		}
		
		return code;
	}

}
