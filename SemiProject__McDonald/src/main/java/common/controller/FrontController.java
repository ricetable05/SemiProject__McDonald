package common.controller;

import java.io.*;
import java.lang.reflect.Constructor;
import java.util.* ;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet(
		description = "사용자가 웹에서 *.run 을 했을 경우 이 서블릿이 응답을 해주도록 한다.",
		urlPatterns = { "*.run" }, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "C:/git/SemiProject__McDonald/SemiProject__McDonald/src/main/webapp/WEB-INF/Command.properties",
						description = "*.run 에 대한 클래스의 매핑파일")
		})

public class FrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	Map<String, Object> cmdMap = new HashMap<>() ; 
	
	public void init(ServletConfig config) throws ServletException {
	// 웹브라우저 주소창에서 *.run을 하면 FrontController 서블릿이 응대를 해오는데 
	// 맨 처음에 자동적으로 실행되어지는 메소드가 init(ServletConfig config) 이다.
	// 여기서 중요한 것은 init(ServletConfig config) 메소드는 WAS(톰캣)가 구동되어진후
	// 딱 1번만 init(ServletConfig config) 메소드가 실행되어지고, 그 이후에는 실행이 되지 않는다.
	// 그러므로, init(ServletConfig config) 메소드에는 FrontController 서블릿이 동작해야할 환경설정을 잡아주는데 사용된다.
		
	// *** 확인용 *** //
	// System.out.println("~~~ 확인용 => 서블릿 FrontController 의  init(ServletConfig config) 메소드가 실행됨.");
	// ~~~ 확인용 => 서블릿 FrontController 의  init(ServletConfig config) 메소드가 실행됨.
	// 웹페이지에 http://localhost:9090/MyMVC/ASDSADASDSA.up 다음과 같이 입력한 경우. 
	// 모든 .run URL 에는 똑같이 찍힐 것이다. 
		
		FileInputStream fis = null ; // 특정 파일에 있는 내용을 읽어오기 위한 용도로 쓰이는 객체 
		
		String props = config.getInitParameter("propertyConfig");
		// System.out.println("@@@ 확인용 props => "+props);
		// @@@ 확인용 props => C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties
		try {
			fis = new FileInputStream(props);
			// fis 는 "C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties 파일의 내용을 읽어오기 위한 용도로 쓰이는 객체이다.
			
			Properties pr = new Properties();
			/*
			 * Properties 는 HashMap의 구버전인 Hashtable을 상속받아 구현한 것으로, Hashtable 은 키와 값(Object,
			 * Object)의 형태로 저장하는데 비해서 Properties 는 (String 키, String 밸류값)의 형태로 저장하는 단순화된 컬렉션
			 * 클래스이다. 키는 고유해야 한다. 즉, KEY(키)는 중복을 허락하지 않는다. 중복된 값을 넣으면 마지막에 넣은 값으로 덮어씌운다. 주로 어플리케이션의
			 * 환경설정과 관련된 속성(property)을 저장하는데 사용되며, 데이터를 파일로 부터 읽고 쓰는 편리한 기능을 제공한다.
			 */
			
			pr.load(fis);
			// pr.load(fis); 은 fis 객체를 사용하여 "C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties 파일의 내용을 읽어다가
			// Properties 클래스의 객체인 pr에 로드시킨다. 
			// 그러면, pr은 읽어온 파일(Command.properties)의 내용에서  = 을 기준으로 왼쪽은 KEY 로 보고, 오른쪽은 Value 로 인식한다.
			
			Enumeration<Object> en = pr.keys(); // key 값을 모두 읽어오는 것이다.
			// pr.keys(); 은 (Command.properties) 파일의 내용물 중 하나인 Key(키)값을 모두 가져오는 것이다.
			
			while(en.hasMoreElements()) {
				String key = (String)en.nextElement();
				// System.out.println("~~~ 확인용 key => "+key);
				//	~~~ 확인용 key => /test/test2.up
				//	~~~ 확인용 key => /test1.up
				String className = pr.getProperty(key);
				// System.out.println("=== 확인용 className => "+className);
				// === 확인용 className => test.controller.Test2Controller
				// === 확인용 className => test.controller.Test1Controller
				
				if ( className != null ) {
					className = className.trim(); 
					Class<?> cls = Class.forName(className);
					// <?> 은 generic인데 어떤 클래스타입인지는 모르지만 하여튼 클래스 타입이 들어온다는 뜻이다.
					// String 타입으로 되어진 className 을 클래스화 시켜주는 것이다.
					// 주의할 점은 실제로 String 으로 되어져 있는 문자열이 클래스로 존재하여야만 하는 것이다.
					// >>> 문자열로 명명되어진 클래스가 존재하지 않습니다.<<<< => 클래스가 없는 경우에 뜬다.
					
					Constructor<?> constrt = cls.getDeclaredConstructor();
					// 생성자 만들기
					Object obj = constrt.newInstance();
					// 생성자로 부터 실제 객체(인스턴스)를 생성해주는 것이다.
					// System.out.println("### 확인용 : "+obj);
					// ### 확인용 : test.controller.Test2Controller@5513a560
					// ### 확인용 : test.controller.Test1Controller@5392756
				
					// System.out.println("--- 확인용 : "+obj.toString());
					// --- 확인용 : ### 클래스 Test2Controller 의 인스턴스 메소드 toString()을 호출함 ###
					// --- 확인용 : @@@ 클래스 Test1Controller 의 인스턴스 메소드 toString()을 호출함 @@@
					
					cmdMap.put(key, obj);
					// 서버를 껐다 킬 때가 아닌 서블릿을 처음으로 실행할 때 이다.
					// cmdMap 에서 키값으로 (Command.properties) 파일에 저장되어진 URL 을 주면, 
					// cmdMap 에서 해당 클래스에 대한 객체(인스턴스)를 얻어오도록 하는 것이다.
				}
				
				
			}// end of while
			
		} catch (FileNotFoundException e) {
			System.out.println(" >>>C:/git/SemiProject__McDonald/SemiProject__McDonald/src/main/webapp/WEB-INF/Command.properties에 파일이 없습니다. <<< ");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println(">>> 문자열로 명명되어진 클래스가 존재하지 않습니다.<<<");
			e.printStackTrace();
		}catch (Exception e) { // 위에의 EXCEPTION을 제외한 기타나머지를 모두 받는다.
			e.printStackTrace();
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 웹브라우저 주소 입력창에서 
		// http://localhost:9090/MyMVC/member/idDuplicateCheck.up?userid=leess 와 같이 입력되었다면
		//String url = request.getRequestURL().toString(); // 리턴 타입이 StringBuffer 이다.
		// System.out.println("~~ 확인용 URL => "+ url);
		// ~~ 확인용 URL => http://localhost:9090/MyMVC/member/idDuplicateCheck.up	
		
		// 웹브라우저 주소 입력창에서 
		// http://localhost:9090/MyMVC/member/idDuplicateCheck.up?userid=leess 와 같이 입력되었다면
		String uri = request.getRequestURI();
		// System.out.println("@@@ 확인용 URI => "+ uri);
		// @@@ 확인용 URI => /MyMVC/member/idDuplicateCheck.up
		// System.out.println(uri.substring(uri.lastIndexOf("/"))); // /idDuplicateCheck.up
		
		// String ctxPath = request.getContextPath();
		// uri.substring(ctxPath.length());
		// System.out.println(uri.substring(ctxPath.length())); // /member/idDuplicateCheck.up
		
		String key = uri.substring(request.getContextPath().length());
		
		AbstractController action = (AbstractController)cmdMap.get(key);
														// return 타입은 object 타입
														// cmdMap에 들어있는 객체는 모두 AbstractController 를 상속 받는 객체이다
			
		if ( action == null ) { // Map 에 key 에 매핑된 value(클래스) 가 없다는 의미이다.
			System.out.println(">>> "+key+" 은 URI 패턴에 매핑된 클래스가 없습니다. <<<");
			// >>> /member/idDuplicateCheck.up 은 URI 패턴에 매핑된 클래스가 없습니다. <<<
		}// end of if 문
		
		else {
			try {
				/*
                post 방식으로 넘어온 데이터중 영어는 글자가 안깨지지만,
                한글은 글자모양이 깨져나온다.
                그래서  post 방식에서 넘어온 한글 데이터가 글자가 안깨지게 하려면 
                아래처럼 request.setCharacterEncoding("UTF-8"); 을 해야 한다.
                주의할 것은 request.getParameter("변수명"); 보다 먼저 기술을 해주어야 한다는 것이다.      
				 */
				request.setCharacterEncoding("UTF-8");
				
				action.execute(request, response); 
				
				boolean bool = action.isRedirect();
				String viewPage = action.getViewPage();
				
				if ( !bool ) { // viewPage 에 명기된 view단 페이지로 forward(dispatcher)를 하겠다는 말이다.
					// forward 되어지면 웹브라우저의 URL 주소는 변경되지 않고 그대로 이면서 화면에 보여지는 내용은 forward 
					// 또한, FORWARD 방식은 forward 되어지는 페이지로 데이터를 전달할 수 있다는 것이다.
					if( viewPage != null ) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
					}
				}
				else { 
					// viewPage 에 명기된 주소로 sendRedirect(웹브라우저의 URL 주소 변경됨) 를 하겠다는 말이다.
					// 즉, 단순히 페이지 이동을 하겠다는 말이다.
					// 암기할 내용은 sendRedirect 방식은 sendRedirect 되어지는 페이지로 데이터를 전달할 수 없다는 것이다.
					if ( viewPage != null ) {
						response.sendRedirect(viewPage); 
						
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		

	}// END OF PROTECTED VOID DOGET(HTTPSERVLETREQUEST REQUEST, HTTPSERVLETRESPONSE RESPONSE) THROWS SERVLETEXCEPTION, IOEXCEPTION {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
