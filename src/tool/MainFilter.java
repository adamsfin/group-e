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

public class MainFilter implements Filter {

	public void doFilter(
		ServletRequest request, ServletResponse response,
		FilterChain chain
	) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		if (httpServletRequest.getSession().getAttribute("user")==null) {
			((HttpServletResponse)response).sendRedirect("../Login.action");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) {}
	public void destroy() {}
}
