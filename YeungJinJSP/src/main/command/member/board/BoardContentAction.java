package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.BoardDBBean;
import main.bean.BoardDataBean;
import main.bean.BookmarkDBBean;
import main.bean.KindDBBean;
import main.bean.MemberDBBean;
import main.bean.MemberDataBean;
import main.bean.RecommendDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class BoardContentAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String boardNum = request.getParameter("bdNum");
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		MemberDBBean memProcess = MemberDBBean.getInstance();
		KindDBBean kindProcess = KindDBBean.getInstance();
		String mem_idEnc = (String) request.getSession().getAttribute("YJFBID_SES");
		
		int board_id = Integer.valueOf(boardNum);
		
		if(boardProcess.addReadcount(board_id) != 1) {
			return "/member/board/boardNotFound.jsp";
		}
		
		BoardDataBean board = boardProcess.getBorad(board_id);
		MemberDataBean member = memProcess.getMember(board.getBorad_userid());
		String kind_name = kindProcess.getKind_name(board.getBoard_kind());
		
		
		if(mem_idEnc != null) {
			SHA256 sha = SHA256.getInstance();
			AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
			int mem_id = Integer.valueOf(aes.aesDecode(mem_idEnc));
			
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
		
		request.setAttribute("nickname", member.getMem_nickname());
		request.setAttribute("level", member.getMem_level());
		request.setAttribute("kind", kind_name);
		request.setAttribute("board", board);
		return "/member/board/boardContent.jsp";
	}
}
