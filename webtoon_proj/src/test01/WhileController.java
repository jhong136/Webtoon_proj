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

import manager.ManagerDAO;
import webtoon.WebtoonDAO;
import webtoon.WebtoonDTO;

/**
 * Servlet implementation class WhileController
 */
@WebServlet("/test01_servlet/while.do")
public class WhileController extends HttpServlet {
	private static String CODEAL = "b";
	private static int CODENO = 1;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");

		String path = request.getSession().getServletContext().getRealPath("/upload");
		//System.out.println("path:"+ path);
		// 결과 ==> 
		//path :C:\jspStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\day0412밑에upload 

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		//out.println("path :"+ path);

		MultipartRequest multi = new MultipartRequest(request, path, "utf-8");

		WebtoonDTO dto = new WebtoonDTO();

		String m_id = multi.getParameter("m_id");
		dto.setT_code(makeCode());
		dto.setT_title(multi.getParameter("title"));
		dto.setT_genre(multi.getParameter("genre"));
		dto.setT_intro(multi.getParameter("intro"));
		dto.setT_img(multi.getFilesystemName("img"));
		dto.setT_age(multi.getParameter("age"));
		
		int cnt = 0;
		String[] writers = new String[4];
		for (int i=0; i<4; i++) {
			String str = "writer" + (i+1);
			writers[i] = multi.getParameter(str);
			if (writers[i].length() != 0) {
				cnt++;
			}
		}
		int nWriters = cnt;
		
		dto.setnWriters(nWriters);
		dto.setWriters(writers);
		
		String[] days = multi.getParameterValues("day");
		int nDays = 0;
		if (days != null)
			nDays = days.length;
		dto.setnDays(nDays);
		dto.setDays(days);

		WebtoonDAO dao = new WebtoonDAO();
		ManagerDAO mDao = new ManagerDAO();
		String m_code = mDao.getMgrCode(m_id);
		
		dao.addWtoon(dto, m_code);
		
		RequestDispatcher rd = request.getRequestDispatcher("/manager/admin.jsp");
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private String makeCode() {		
		String code = CODEAL + CODENO;
		CODENO++;
		if (CODENO > 999) {
			CODENO = 1;
			CODEAL = CODEAL + 1;
		}
		
		return code;
	}
}
