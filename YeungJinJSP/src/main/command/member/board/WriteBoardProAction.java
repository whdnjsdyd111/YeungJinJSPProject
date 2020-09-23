package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.BoardDBBean;
import main.bean.MemberDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class WriteBoardProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int kind = Integer.valueOf(request.getParameter("kind"));
		String idEnc = String.valueOf(request.getSession().getAttribute("YJFBID_SES"));
		
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
		
		String idDec = aes.aesDecode(idEnc);
		
		if(kind == 600 || kind == 700) {
			request.setAttribute("check", new Integer(0));
			return "/member/board/writeBoardPro.jsp";
		}
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		int check = boardProcess.insertBoard(Integer.valueOf(idDec), kind, title, content);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/writeBoardPro.jsp";
	}
}
