package tool;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainFilter implements Filter {

	public void doFilter(
		ServletRequest request, ServletResponse response,
		FilterChain chain
	) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession session = httpServletRequest.getSession();

		if (session.getAttribute("user")==null) {
			((HttpServletResponse)response).sendRedirect("../Login.action");
		} else {
			if (!httpServletRequest.getServletPath().contains("TestRegist")) {
				session.removeAttribute("inputVal");
				session.removeAttribute("tests");
			} if (!httpServletRequest.getServletPath().contains("StudentCreate")) {
				session.removeAttribute("class_num_set");
			}
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) {}
	public void destroy() {}
}
