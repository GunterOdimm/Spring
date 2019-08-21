package study.spring.hellospring.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggerInterceptor extends HandlerInterceptorAdapter{
	long startTime = 0;
	long endTime = 0;
	/**
	 * Controller 실행 요청 전에 수행되는 메서드
	 * 클라이언트의 요청을 컨트롤러에 전달 하기 전에 호출된다.
	 * return 값으로 boolean값을 전달하는데 false인 경우 controller를 실행 시키지 않고 요청을 정료한다.
	 * 보통 이곳에서 각종 체크작업과 로그를 기록하는 작업을 진행한다.
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("=================================preHandle=================================");
		
		// 컨트롤러 실행 직전에 현재 시작을 저장한다.
		startTime = System.currentTimeMillis();
		
		// 이전에 머물렀던 페이지
		String referer = request.getHeader("referer");
		
		// 이전 종료시간이 0 보다 크면 새로운 시작시간과의 차이는 이전 페이지에 머문 시간을 의미한다.
		if(referer != null && endTime > 0) {
			System.out.println(String.format("[referer] (%dms) %s", startTime - endTime, referer));
		}
		
		// get 방식인지 post 방식인지 조회한다.
		String methodName = request.getMethod();

		// 현재 URL을 획득한다
		String url = request.getRequestURL().toString();

		// URL에서 ? 이후 전달되는 get파라미터 문자열을 모두 가져온다.
		String queryString = request.getQueryString();

		if (request.getQueryString() != null) {
			url = url + "?" + queryString;
		}

		// 획득한 정보를 로그로 표시한다.
		System.out.println(String.format("[%s] %s", methodName, url));
		
		Map<String, String[]> params = request.getParameterMap();
		
		for(String key: params.keySet()) {
			String[] value = params.get(key);
			System.out.println(String.format("(p) < ==-- %s = %s",key,String.join(",",value)));
		}
		
		return super.preHandle(request, response, handler);
	}
	/**
	* view 단으로 forward되기 전에 수해한다.
	* 컨트롤러 로직이 실행된 이후 호출된다.
	* 컨트롤러 단에서 에러 발생 시 해당 메서드는 수행되지 않는다.
	* request로 넘어온 데이터 가공 시 많이 사용된다.
	* 
	*/

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("=================================postHandle=================================");
		
		// 컨트롤러 종료시의 시작을 가지고온다.
		endTime = System.currentTimeMillis();
		
		// 시작시간과 종료시간 사이의 차이를 구하면 페이지의 실행 시간을 구할 수 있다.
		System.out.println(String.format("running time: %d(ms)\n",endTime-startTime));
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	/**
	 * 컨트롤러가 종료 후 view가 정삭적으로 랜더링 된 후 제일 마지막에 실행이 되는 메서드.
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("=================================afterCompletion=================================");
		super.afterCompletion(request, response, handler, ex);
	}
	
	/**
	 * Servlet 3.0 부터 비동기 요청이 가능해짐에 따라 비동기 요청시
	 * PostHandle와 afterCompletion메서드 를 수행하지 않고 이 메서드를 수행하게 된다.
	 * 애초에 웹이 비동기 요청을 잘안해서 거의 사용을 안한다고 생각하면 된다.
	 * 
	 */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("=================================afterConcurrentHandlingStarted=================================");
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
}
