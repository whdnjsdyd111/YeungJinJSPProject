package main.command.admin.dashboard;

import java.util.Arrays;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.command.CommandAction;

public class StatisticsAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] date = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };
		Calendar cal = Calendar.getInstance();
		
		List<String> dates = new LinkedList<String>();
		dates.addAll(Arrays.asList(date));
		
		for (int i = 0; i < cal.get(Calendar.DAY_OF_WEEK); i++) {
			dates.add(dates.get(0));
			dates.remove(0);
		}

		request.setAttribute("dates", dates);
		return "/admin/dashboard/statistics.jsp";
	}
}
