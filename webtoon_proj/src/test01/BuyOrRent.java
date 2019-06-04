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

import reader.ReaderDAO;
import reader.ReaderDTO;

/**
 * Servlet implementation class BuyOrRent
 */
@WebServlet("/test01_servlet/buyrent.do")
public class BuyOrRent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyOrRent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/upload");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		MultipartRequest multi = new MultipartRequest(request, path, "utf-8");
		
		String r_id = multi.getParameter("r_id");
		ReaderDAO rDao = new ReaderDAO();
		String r_nickname = rDao.getNickname(r_id);
		
		
		String t_code = multi.getParameter("t_code");
		int t_no = Integer.parseInt(multi.getParameter("t_no"));		
		String menu = multi.getParameter("bOrR");
		System.out.println(menu);
		
		RequestDispatcher rd = null;
		
		request.setAttribute("t_code", t_code);
		request.setAttribute("t_no", t_no);
		
		if (menu.equals("구매")) {
			rDao.buyTEp(r_nickname, t_code, t_no);
			rDao.decCoin(r_nickname, rDao.getCoin(r_nickname)-3);
			rd = request.getRequestDispatcher("/reader/rShowEp.jsp");
			rd.forward(request, response);
		}
		else if (menu.equals("대여")) {
			rDao.rentTEp(r_nickname, t_code, t_no);
			rDao.decCoin(r_nickname, rDao.getCoin(r_nickname)-1);
			rd = request.getRequestDispatcher("/reader/rShowEp.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
