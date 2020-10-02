package main.command.member.board;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.command.CommandAction;

public class ImageUploadAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println(request.getContentType());
		
		/*
		String realFolder = "";	// 웹 애플리케이션 상의 절대 경로 저장
		String saveFolder = "/upload";	// 파일 업로드 폴더 지정
		String encType = "utf-8";	// 인코딩 타입
		int maxSize = 10 * 1024 * 1024;	// 업로드될 파일 크기 최대 10Mb
		
		List<String> results = null;
		
		// 현재 jsp 페이지의 웹 애플리케이션 상의 절대 경로를 구함
		ServletContext context = request.getSession().getServletContext();
		realFolder = context.getRealPath(saveFolder);
		*/ 
		
		String realFolder = "C:/Users/PC/git/YeungJinJSPProject/YeungJinJSP/WebContent/upload";
		String encType = "utf-8";
		int maxSize = 10 * 1024 * 1024;
		
		List<String> results = null;
		
		try {
			MultipartRequest upload = new MultipartRequest(request, realFolder, maxSize,
					encType, new DefaultFileRenamePolicy());

			// <input type="file">인 모든 파라미터를 얻어냄
			Enumeration<?> files = upload.getFileNames();
			
			
			/*
			// 업로드된 모든 파일의 정보를 반복해서 얻어냄
			while(files.hasMoreElements()) {
				String name = (String) files.nextElement();	// 파라미터명
				// 서버에 업로드된 파일명
				String filename = upload.getFilesystemName(name);
				// 원래 파일명
				String original = upload.getOriginalFileName(name);
				// 업로드된 파일의 타입 - 파일 종류
				String type = upload.getContentType(name);
				
				// 결과 문자열 누적
				result += "파라미터 이름 : " + name + "\n";
				result += "실제 파일 이름 : " + original + "\n";
				result += "저장된 파일 이름 : " + filename + "\n";
				result += "파일 타입 : " + type + "\n";
				
				// 업로드된 파일의 정보를 얻어내기 위해 File 객체로 생성
				File file = upload.getFile(name);
				if(file != null)
					result += "크기 : " + file.length() + "bytes \n";	// 파일 크기
				
				result += "이미지 태그 : " + "(img src='" + realFolder + "\\" + filename + "')\n";
				result += "파일 경로 : " + realFolder + "\n\n";
			}*/
			
			results = new ArrayList<String>();
			
			
			while(files.hasMoreElements()) {
				String name = (String) files.nextElement();
				
				String fileName = upload.getFilesystemName(name);	// 서버 측에 업로드 된 파일 이름
				
				String result = realFolder + "\\" + fileName;
				results.add(result);
				
				System.out.println(realFolder);
				System.out.println(fileName);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("results", results);
		return "/member/board/imageUpload.jsp";
	}
}
