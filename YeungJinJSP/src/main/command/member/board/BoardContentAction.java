package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.BoardDBBean;
import main.bean.BoardDataBean;
import main.bean.BookmarkDBBean;
import main.bean.KindDBBean;
import main.bean.MemberDBBean;
import main.bean.MemberDataBean;
import main.bean.PageViewDBBean;
import main.bean.RecommendDBBean;
import main.command.CommandAction;

public class BoardContentAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String boardNum = request.getParameter("bdNum");
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		MemberDBBean memProcess = MemberDBBean.getInstance();
		KindDBBean kindProcess = KindDBBean.getInstance();
		Object mem_id_obj = request.getSession().getAttribute("YJFBID_SES");
		
		int board_id = Integer.valueOf(boardNum);
		
		if(boardProcess.addReadcount(board_id) != 1) {
			return "/member/board/boardNotFound.jsp";
		}
		
		BoardDataBean board = boardProcess.getBorad(board_id);
		MemberDataBean member = memProcess.getMember(board.getBorad_userid());
		String kind_name = kindProcess.getKind_name(board.getBoard_kind());
		
		
		if(mem_id_obj != null) {
			int mem_id = (Integer) mem_id_obj;
			
			BookmarkDBBean bookmarkProcess = BookmarkDBBean.getInstance();
			RecommendDBBean recommendProcess = RecommendDBBean.getInstance();
			
			String nonReco = recommendProcess.getCheckReco(board_id, mem_id);
			
			if(bookmarkProcess.checkBookmark(board_id, mem_id))
				request.setAttribute("bookmark", "Y");
			
			if(nonReco != null)
				request.setAttribute("nonReco", nonReco);
			
			if(boardProcess.hostCheck(board_id, mem_id))
				request.setAttribute("host", "Y");
		}
		
		PageViewDBBean.getInstance().insertUpdatePageView();
		
		request.setAttribute("nickname", member.getMem_nickname());
		request.setAttribute("level", member.getMem_level());
		request.setAttribute("kind", kind_name);
		request.setAttribute("board", board);
		return "/member/board/boardContent.jsp";
	}
}
