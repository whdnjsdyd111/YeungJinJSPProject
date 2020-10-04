package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.ReportDBBean;
import main.command.CommandAction;

public class ReportAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String rep_content = request.getParameter("rep_content");
		int rep_kind = Integer.valueOf(request.getParameter("rep_kind"));
		int cont_id = Integer.valueOf(request.getParameter("contents_id"));
		String cont_kind = request.getParameter("contents_kind");
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		int check = ReportDBBean.getInstance().insertReport(rep_content, cont_id, cont_kind, rep_kind, mem_id);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/report.jsp";
	}
}
