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
			// 북마크 디비에 값이 있는데 북마크 취소한 경우
			// delete 하기
			int bookmark_db_check = bookmarkProcess.deleteBookmark(mem_id, board_id);
			request.setAttribute("bookmark_db_check", new Integer(bookmark_db_check));
		}
		
		if(!check_db_bookmark && check_bookmark) {
			// 북마크 디비에 값이 없는데 북마크 체크한 경우
			// insert 하기
			int bookmark_db_check = bookmarkProcess.insertBookmark(mem_id, board_id);
			request.setAttribute("bookmark_db_check", new Integer(bookmark_db_check));
		}
		
		if(check_db_reco) {
			// 추천 디비에 값이 있을 경우
			if(check_reco) {
				// 추천일 경우 nonreco N로 UPDATE
				int reco_db_check = recomendProcess.updateNonRecoN(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
			
			if(check_nonReco) {
				// 비추일 경우 nonreco Y로 UPDATE
				int reco_db_check = recomendProcess.updateNonRecoY(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
			
			if(!check_reco && !check_nonReco) {
				// 둘다 체크 안되있으면 디비 DELETE
				int reco_db_check = recomendProcess.deleteReco(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
				
		} else {
			// 추천 디비에 값이 없을 경우
			if(check_reco) {
				// 추천일 경우 INSERT
				int reco_db_check = recomendProcess.insertReco(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
			
			if(check_nonReco) {
				// nonReco Y로 INSERT
				int reco_db_check = recomendProcess.insertNonReco(board_id, mem_id);
				boardProcess.updateReco(board_id, reco, nonReco);
				request.setAttribute("reco_db_check", new Integer(reco_db_check));
			}
		}
			
		return "/member/board/bookmarkRecoInsert.jsp";
	}
}
