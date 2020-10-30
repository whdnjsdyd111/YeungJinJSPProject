package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AdminDBBean;
import main.bean.BoardDBBean;
import main.bean.MemberDBBean;
import main.command.CommandAction;

public class WriteBoardProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int kind = Integer.valueOf(request.getParameter("kind"));
		int id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		
		int check = 0;
		
		if(kind == 600 || kind == 700) {
			if(AdminDBBean.getInstance().checkAdminId(id) > 0) {
				check = boardProcess.insertBoard(id, kind, title, content);
				
				if(check == 1) {
					int check2 = MemberDBBean.getInstance().addEx(id, 100);
					
					if(check2 != 1)
						return "/error/DBFail.jsp";
				}
			}
			
			request.setAttribute("check", new Integer(check));
			return "/member/board/writeBoardPro.jsp";
		} else {
			check = boardProcess.insertBoard(id, kind, title, content);
			
			if(check == 1) {
				int check2 = MemberDBBean.getInstance().addEx(id, 100);
				
				if(check2 != 1)
					return "/error/DBFail.jsp";
			}
		}
		request.setAttribute("check", new Integer(check));
		return "/member/board/writeBoardPro.jsp";
	}
}
