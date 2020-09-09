package main.command.member.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.BoardDBBean;
import main.bean.BoardDataBean;
import main.bean.JoinBoardMemberKindDataBean;
import main.command.CommandAction;

public class MainBoardAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		String kind = request.getParameter("kind");
		String sort = request.getParameter("sort");
		
		if(kind == null || sort == null)
			return "/member/board/mainBoard.jsp";
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		
		if(page == null)
			page = "1";
			
		
		List<JoinBoardMemberKindDataBean> boardList = null;
		
		if(kind.equals("all")) {
			if(sort.equals("pop"))
				boardList = boardProcess.getJoinBdMemKindOrderByReco(Integer.valueOf(page));
			else if(sort.equals("recent"))
				boardList = boardProcess.getJoinBdMemKindOrderByTime(Integer.valueOf(page));
		} else {
			if(sort.equals("pop"))
				boardList = boardProcess.getJoinBdMemKindOrderByReco(Integer.valueOf(page), Integer.valueOf(kind));
			else if(sort.equals("recent"))
				boardList = boardProcess.getJoinBdMemKindOrderByTime(Integer.valueOf(page), Integer.valueOf(kind));
		}
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("page", page);
		request.setAttribute("kind", kind);
		request.setAttribute("sort", sort);
		return "/member/board/mainBoard.jsp";
	}
}
