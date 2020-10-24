package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.BoardDBBean;
import main.command.CommandAction;

public class ContentsManagementAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");

		if (search == null || sort == null) {
			request.setAttribute("none_param", new Integer(1));
			return "/admin/dashboard/contentsManagement.jsp";
		}
		
		if (search.equals("board")) {
			if (sort.equals("recent")) {
				request.setAttribute("board", BoardDBBean.getInstance().getJoinBdMemKindOrderByTime());
			} else if (sort.equals("recommend")) {
				request.setAttribute("board", BoardDBBean.getInstance().getJoinBdMemKindOrderByReco());
			} else if (sort.equals("nonRecommend")) {
				request.setAttribute("board", BoardDBBean.getInstance().getJoinBdMemKindOrderByNoReco());
			} else {
				request.setAttribute("none_param", new Integer(1));
				return "/admin/dashboard/contentsManagement.jsp";
			}
		} else if (search.equals("comment")) {
//			if (sort.equals("recent")) {
//				request.setAttribute("comment", CommentDBBean.getInstance().getCommentRecentList());
//			} else if (sort.equals("recommend")) {
//				request.setAttribute("comment", CommentDBBean.getInstance().getCommentRecoList());
//			} else if (sort.equals("nonRecommend")) {
//				request.setAttribute("comment", CommentDBBean.getInstance().getCommentNonRecoList());
//			} else {
//				request.setAttribute("none_param", new Integer(1));
//				return "/admin/dashboard/contentsManagement.jsp";
//			}
		} else {
			request.setAttribute("none_param", new Integer(1));
			return "/admin/dashboard/contentsManagement.jsp";
		}

		return "/admin/dashboard/contentsManagement.jsp";
	}
}
