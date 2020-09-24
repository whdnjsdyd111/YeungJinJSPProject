package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.BoardDBBean;
import main.bean.BoardDataBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class UpdateBoardFormAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		BoardDataBean board = null;
		
		request.setCharacterEncoding("utf-8");
		int board_id = Integer.valueOf(request.getParameter("bdNum"));
		int mem_id = Integer.valueOf(aes.aesDecode((String) request.getSession().getAttribute("YJFBID_SES")));
		
		board = boardProcess.getBorad(board_id);
		
		if(board == null)
			return "/member/board/boardNotFound.jsp";
		
		if(board.getBorad_userid() == mem_id) {
			request.setAttribute("board", board);
		}
		
		return "/member/board/updateBoardForm.jsp";
	}
}
