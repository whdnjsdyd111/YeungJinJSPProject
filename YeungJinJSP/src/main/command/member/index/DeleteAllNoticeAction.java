package main.command.member.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AdminNoticeDBBean;
import main.bean.NoticeDBBean;
import main.command.CommandAction;

public class DeleteAllNoticeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		int check = (NoticeDBBean.getInstance().deleteAll(mem_id) > 0 || AdminNoticeDBBean.getInstance().deleteAllNotice(mem_id) > 0) ? 1 : 0;
		
		request.setAttribute("check", new Integer(check));
		return "/member/index/deleteAllNotice.jsp";
	}
}
