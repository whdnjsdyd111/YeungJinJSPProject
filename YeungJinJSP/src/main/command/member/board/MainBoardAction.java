package main.command.member.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.BoardDBBean;
import main.bean.JoinBoardMemberKindDataBean;
import main.bean.KindDBBean;
import main.command.CommandAction;

public class MainBoardAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		String kind = request.getParameter("kind");
		String sort = request.getParameter("sort");
		String target = request.getParameter("target");
		String search = request.getParameter("search");
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		KindDBBean kindProcess = KindDBBean.getInstance();
			
		List<JoinBoardMemberKindDataBean> boardList = null;
		
		if(kind == null)
			return "/member/board/mainBoard.jsp";
		
		if(page == null)
			page = "1";
		
		if(kind.equals("bookmark")) {
			boardList = boardProcess.getJoinBdMemKindFindBookmark(Integer.valueOf(page), 
					(Integer) request.getSession().getAttribute("YJFBID_SES"));
			request.setAttribute("boardList", boardList);
			request.setAttribute("page", page);
			request.setAttribute("kind", kind);
			return "/member/board/mainBoard.jsp";
		}
		
		if(sort == null && (target == null || search == null))
			return "/member/board/mainBoard.jsp";
		
		if(kind.equals("all")) {
			if(sort != null) {
				if(sort.equals("pop"))
					boardList = boardProcess.getJoinBdMemKindOrderByReco(Integer.valueOf(page));
				else if(sort.equals("recent"))
					boardList = boardProcess.getJoinBdMemKindOrderByTime(Integer.valueOf(page));
				else if(sort.equals("TODAY"))
					boardList = boardProcess.getJoinBdMemKindOrderByRecoToday(Integer.valueOf(page));
				else if(sort.equals("nonReco"))
					boardList = boardProcess.getJoinBdMemKindOrderByNoReco(Integer.valueOf(page));
			} else {
				if(target.equals("writer"))
					boardList = boardProcess.getJoinBdMemKindFindWriter(Integer.valueOf(page), search);
				else if(target.equals("content"))
					boardList = boardProcess.getJoinBdMemKindFindContent(Integer.valueOf(page), search);
				else if(target.equals("title"))
					boardList = boardProcess.getJoinBdMemKindFindTitle(Integer.valueOf(page), search);
			}
		} else {
			try {
				Integer.valueOf(kind);
			} catch (NumberFormatException e) {
				return "/member/board/mainBoard.jsp";
			}
			if(sort != null) {
				if(sort.equals("pop"))
					boardList = boardProcess.getJoinBdMemKindOrderByReco(Integer.valueOf(page), Integer.valueOf(kind));
				else if(sort.equals("recent"))
					boardList = boardProcess.getJoinBdMemKindOrderByTime(Integer.valueOf(page), Integer.valueOf(kind));
				else if(sort.equals("TODAY"))
					boardList = boardProcess.getJoinBdMemKindOrderByRecoToday(Integer.valueOf(page), Integer.valueOf(kind));
				else if(sort.equals("nonReco"))
					boardList = boardProcess.getJoinBdMemKindOrderByNoReco(Integer.valueOf(page), Integer.valueOf(kind));
			} else {
				if(target.equals("writer"))
					boardList = boardProcess.getJoinBdMemKindFindWriter(Integer.valueOf(page), Integer.valueOf(kind), search);
				else if(target.equals("content"))
					boardList = boardProcess.getJoinBdMemKindFindContent(Integer.valueOf(page), Integer.valueOf(kind), search);
				else if(target.equals("title"))
					boardList = boardProcess.getJoinBdMemKindFindTitle(Integer.valueOf(page), Integer.valueOf(kind), search);
			}
		}
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("page", page);
		request.setAttribute("kind", kind);
		
		if(!kind.equals("all")) {
			request.setAttribute("kind_name", kindProcess.getKind_name(Integer.valueOf(kind)));
		}

		request.setAttribute("sort", sort);
		request.setAttribute("search", search);
		return "/member/board/mainBoard.jsp";
	}
}
