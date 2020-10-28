package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.ReportDBBean;
import main.command.CommandAction;

public class ReportAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("reports", ReportDBBean.getInstance().getReportList());
		
		return "/admin/dashboard/report.jsp";
	}
}
