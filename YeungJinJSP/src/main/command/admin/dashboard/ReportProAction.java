package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AdminNoticeDBBean;
import main.bean.MemberDBBean;
import main.bean.ReportDBBean;
import main.command.CommandAction;

public class ReportProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String mem_id = request.getParameter("mem_id");
		
		if(mem_id != null) {
			MemberDBBean.getInstance().addEx(Integer.parseInt(mem_id), 400);
			AdminNoticeDBBean.getInstance().insertAdminNotice(Integer.parseInt(mem_id), "신고 처리가 되었습니다. 경험치 400을 받으셨습니다.");
		}
		request.setAttribute("check", ReportDBBean.getInstance().deleteReport(Integer.parseInt(request.getParameter("rep_id"))));
		return "/admin/dashboard/reportPro.jsp";
	}
}
