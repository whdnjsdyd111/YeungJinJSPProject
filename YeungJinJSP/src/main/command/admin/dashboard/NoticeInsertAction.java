package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AdminNoticeDBBean;
import main.bean.MemberDBBean;
import main.command.CommandAction;

public class NoticeInsertAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String kind = request.getParameter("kind");
		String val = request.getParameter("val");
		int mem_id = Integer.parseInt(request.getParameter("mem_id"));
		AdminNoticeDBBean adminNotice = AdminNoticeDBBean.getInstance();
		MemberDBBean member = MemberDBBean.getInstance();
		
		if(kind == null)
			request.setAttribute("check", adminNotice.insertAdminNotice(mem_id,
					request.getParameter("notice_content")));	
		else if(kind.equals("level"))
			request.setAttribute("check", (adminNotice.insertAdminNotice(mem_id,
					request.getParameter("notice_content")) == 
					member.updateLevel(mem_id, Integer.parseInt(val)) ? 1 : 0));
		else if(kind.equals("ex"))
			request.setAttribute("check", (adminNotice.insertAdminNotice(mem_id,
					request.getParameter("notice_content")) == 
					member.updateEx(mem_id, Integer.parseInt(val)) ? 1 : 0));
		else if(kind.equals("auth"))
			request.setAttribute("check", (adminNotice.insertAdminNotice(mem_id,
					request.getParameter("notice_content")) == 
					member.updateAuth(mem_id, val) ? 1 : 0));
			
		return "/admin/dashboard/noticeInsert.jsp";
	}
}
