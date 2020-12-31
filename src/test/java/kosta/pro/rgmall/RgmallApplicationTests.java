package kosta.pro.rgmall;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class RgmallApplicationTests {
	@Autowired

	@Test
	void contextLoads(HttpSession session, HttpServletRequest request) {
		
		String realPath = session.getServletContext().getRealPath("/");
		System.out.println("realPath : " +  realPath);
		System.out.println("contextPath : " +  request.getContextPath());
		String path = "C:/Edu";
		File Folder = new File(path);
		
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		path = "C:/Edu/save";
		Folder = new File(path);
		
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
	}
	

}
