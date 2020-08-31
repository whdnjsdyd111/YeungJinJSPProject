package main.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.command.CommandAction;

/**
 * Servlet implementation class conroller
 */
@WebServlet(
		urlPatterns = { 
				"/Controller", 
				"*.do"
		}, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "command.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Object> commandMap = new HashMap<>();
	
    /**
     * Default constructor. 
     */
    public Controller() {
        super();
    }
    
    /**
	 * @see Servlet#init(ServletConfig)
	 */
    @Override
    public void init(ServletConfig config) throws ServletException {
    	
    	String props = config.getInitParameter("propertyConfig");	// initParams���� propertyConfig ��������
    	String realFolder = "/property";	// properties�� ����� ���͸�
    	
    	ServletContext context = config.getServletContext();	// �� �����̳� ��Ʈ ���
    	
    	String realPath = context.getRealPath(realFolder) + "\\" + props;	// �� ���ø����̼� �ý��� �� ���
    	
    	Properties pr = new Properties();
    	FileInputStream f = null;
    	
    	try {
			f = new FileInputStream(realPath);	// command.properties ������ ������ �о��
			
			pr.load(f);	// command.properties�� ������ Properties ��ü pr�� ����
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			if(f != null)
				try { f.close(); } catch (IOException ex) {}
		}
    	
    	Iterator<?> iterator = pr.keySet().iterator();
    	
    	while(iterator.hasNext()) {
    		String command = (String) iterator.next();
    		String className = pr.getProperty(command);
    		
    		try {
				Class<?> commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandAction com = null;
		
		try {
			String command = request.getRequestURI();

			if(command.indexOf(request.getContextPath()) == 0)
					command = command.substring(request.getContextPath().length());

			com = (CommandAction) commandMap.get(command);
			view = com.requestPro(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		request.setAttribute("cont", view);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
}
