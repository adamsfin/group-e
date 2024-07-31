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

public class LoginFilter implements Filter {

	public void doFilter(
		ServletRequest request, ServletResponse response,
		FilterChain chain
	) throws IOException, ServletException {
		if (((HttpServletRequest)request).getSession().getAttribute("user")!=null) {
			((HttpServletResponse)response).sendRedirect("main/Menu.action");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) {}
	public void destroy() {}
}
