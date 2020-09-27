package main.command.member.board;

import java.io.File;
import java.util.Enumeration;

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
		
		String realFolder = "";	// �� ���ø����̼� ���� ���� ��� ����
		String saveFolder = "/upload";	// ���� ���ε� ���� ����
		String encType = "utf-8";	// ���ڵ� Ÿ��
		int maxSize = 10 * 1024 * 1024;	// ���ε�� ���� ũ�� �ִ� 10Mb
		
		
		// ���� jsp �������� �� ���ø����̼� ���� ���� ��θ� ����
		ServletContext context = request.getSession().getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		String result = "";
		
		try {
			MultipartRequest upload = new MultipartRequest(request, realFolder, maxSize,
					encType, new DefaultFileRenamePolicy());

			// <input type="file">�� ��� �Ķ���͸� ��
			Enumeration<?> files = upload.getFileNames();
			
			
			
			// ���ε�� ��� ������ ������ �ݺ��ؼ� ��
			while(files.hasMoreElements()) {
				String name = (String) files.nextElement();	// �Ķ���͸�
				// ������ ���ε�� ���ϸ�
				String filename = upload.getFilesystemName(name);
				// ���� ���ϸ�
				String original = upload.getOriginalFileName(name);
				// ���ε�� ������ Ÿ�� - ���� ����
				String type = upload.getContentType(name);
				
				// ��� ���ڿ� ����
				result += "�Ķ���� �̸� : " + name + "\n";
				result += "���� ���� �̸� : " + original + "\n";
				result += "����� ���� �̸� : " + filename + "\n";
				result += "���� Ÿ�� : " + type + "\n";
				
				// ���ε�� ������ ������ ���� ���� File ��ü�� ����
				File file = upload.getFile(name);
				if(file != null)
					result += "ũ�� : " + file.length() + "bytes \n";	// ���� ũ��
				
				result += "�̹��� �±� : " + "(img src='" + realFolder + "\\" + filename + "')\n";
				result += "���� ��� : " + realFolder + "\n";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(result);
		return "/member/board/imageUpload.jsp";
	}
}
