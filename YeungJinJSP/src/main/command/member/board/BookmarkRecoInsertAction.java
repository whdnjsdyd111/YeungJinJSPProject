package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.BoardDBBean;
import main.bean.BookmarkDBBean;
import main.bean.RecommendDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class BookmarkRecoInsertAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		if(request.getSession().getAttribute("YJFBID_SES") == null)
			return "/member/board/bookmarkRecoInsert.jsp";
		
		request.setCharacterEncoding("utf-8");
		
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		BookmarkDBBean bookmarkProcess = BookmarkDBBean.getInstance();
		RecommendDBBean recomendProcess = RecommendDBBean.getInstance();
		
		int board_id = Integer.valueOf(request.getParameter("board_id"));
		int mem_id = Integer.valueOf(aes.aesDecode((String) request.getSession().getAttribute("YJFBID_SES")));
		
		boolean check_reco = Boolean.valueOf(request.getParameter("check_reco"));
		boolean check_nonReco = Boolean.valueOf(request.getParameter("check_nonReco"));
		boolean check_bookmark = Boolean.valueOf(request.getParameter("check_bookmark"));
		
		boolean check_db_reco = Boolean.valueOf(request.getParameter("check_db_reco"));
		boolean check_db_bookmark = Boolean.valueOf(request.getParameter("check_db_bookmark"));
		
		int reco = Integer.valueOf(request.getParameter("reco"));
		int nonReco = Integer.valueOf(request.getParameter("nonReco"));
		
		if(check_db_bookmark && !check_bookmark) {
			// �ϸ�ũ ��� ���� �ִµ� �ϸ�ũ ����� ���
			// delete �ϱ�
			int bookmark_db_check = bookmarkProcess.deleteBookmark(mem_id, board_id);
			request.setAttribute("bookmark_db_check", new Integer(bookmark_db_check));
		}
		
		if(!check_db_bookmark && check_bookmark) {
			// �ϸ�ũ ��� ���� ���µ� �ϸ�ũ üũ�� ���
			// insert �ϱ�
			int bookmark_db_check = bookmarkProcess.insertBookmark(mem_id, board_id);
			request.setAttribute("bookmark_db_check", new Integer(bookmark_db_check));
		}
		
		if(check_db_reco) {
			// ��õ ��� ���� ���� ���
			if(check_reco) {
				// ��õ�� ��� nonreco N�� UPDATE
				int reco_db_check = recomendProcess.updateNonRecoN(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
			
			if(check_nonReco) {
				// ������ ��� nonreco Y�� UPDATE
				int reco_db_check = recomendProcess.updateNonRecoY(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
			
			if(!check_reco && !check_nonReco) {
				// �Ѵ� üũ �ȵ������� ��� DELETE
				int reco_db_check = recomendProcess.deleteReco(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
				
		} else {
			// ��õ ��� ���� ���� ���
			if(check_reco) {
				// ��õ�� ��� INSERT
				int reco_db_check = recomendProcess.insertReco(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
			
			if(check_nonReco) {
				// nonReco Y�� INSERT
				int reco_db_check = recomendProcess.insertNonReco(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
		}
			
		return "/member/board/bookmarkRecoInsert.jsp";
	}
}
