package main.command.member.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.NoticeDBBean;
import main.command.CommandAction;

public class DeleteNoticeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		int board_id = Integer.valueOf(request.getParameter("board"));
		int kind_id = Integer.valueOf(request.getParameter("kind"));
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		int check = NoticeDBBean.getInstance().deleteNotice(mem_id, board_id, kind_id);
		
		request.setAttribute("check", new Integer(check));
		return "/member/index/deleteNotice.jsp";
	}
}
