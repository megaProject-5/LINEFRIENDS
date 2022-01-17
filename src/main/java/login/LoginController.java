package login;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

public class LoginController {
	

	// 로그인을 하기 위해
	@GetMapping("/member")
	public String LoginDto() {
		return "/member/login";
	}
	
	// 로그인 결과값을 보여주기 위해?
	@RequestMapping("/login")
	public void aaaaa() {
		// 
	}
}
 