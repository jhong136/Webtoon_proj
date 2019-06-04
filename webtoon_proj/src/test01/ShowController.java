package test01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import reader.ReaderDAO;
import webtoon.TEpisodeDAO;
import webtoon.TEpisodeDTO;
import webtoon.WebtoonDAO;
import webtoon.WebtoonDTO;

/**
 * Servlet implementation class ShowController
 */
@WebServlet("/test01_servlet/show.do")
public class ShowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowController() {
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
		//out.println("path :" + path);

		MultipartRequest multi = new MultipartRequest(request, path, "utf-8");
		
		String r_nickname = multi.getParameter("r_id");
		String t_code = multi.getParameter("t_code");
		int no = Integer.parseInt(multi.getParameter("t_no"));
		
		WebtoonDAO wDao = new WebtoonDAO();
		WebtoonDTO wDto = wDao.getWtByCode(t_code);
		
		TEpisodeDAO epDao = new TEpisodeDAO();
		TEpisodeDTO epDto = epDao.getEp(t_code, no);
		
		boolean isEnd = false;
		for (int i=0; i<wDto.getnDays(); i++) {
			if (wDto.getDays()[i] == "완결") {
				isEnd = true;
				break;
			}
		}
		
		ReaderDAO rDao = new ReaderDAO();
		List<TEpisodeDTO> buyList = rDao.getBuyEp(r_nickname, t_code);
		List<TEpisodeDTO> rentList = rDao.getRentEp(r_nickname, t_code);
		
		RequestDispatcher rd = null;
		
		request.setAttribute("t_code", t_code);
		request.setAttribute("t_no", no);
		
		if (!isEnd) {
			if (epDto.getT_no()+1 > epDao.getCount(t_code)) {
				if (!isInList(epDto, buyList)) {
					System.out.println("1");
					if (!isInList(epDto, rentList)) {
						System.out.println("2");
						// 구매 또는 대여 창으로
						rd = request.getRequestDispatcher("/reader/buyOrRent.jsp");
						rd.forward(request, response);
					}
					else if (epDao.getEndDate(r_nickname, t_code, no).compareTo(new Date())>0) {
						System.out.println("3");
						// 구매 또는 대여창
						rd = request.getRequestDispatcher("/reader/buyOrRent.jsp");
						rd.forward(request, response);
					}
					else {
						// 웹툰보기가능
						System.out.println("4");
						rd = request.getRequestDispatcher("/reader/rShowEp.jsp");
						rd.forward(request, response);
					}
				}
				else {
					//웹툰보기가능
					System.out.println("5");
					rd = request.getRequestDispatcher("/reader/rShowEp.jsp");
					rd.forward(request, response);
				}
			}
			else {
				System.out.println("6");
				//웹툰보기가능
				rd = request.getRequestDispatcher("/reader/rShowEp.jsp");
				rd.forward(request, response);
			}
		}
		else {
			
		}
	}

	private boolean isInList(TEpisodeDTO dto, List<TEpisodeDTO> list) {
		for (TEpisodeDTO d : list) {
			if (d.getT_code().equals(dto.getT_code())) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
