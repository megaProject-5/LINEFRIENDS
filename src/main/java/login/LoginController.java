package login;

import org.springframework.web.bind.annotation.GetMapping;

public class LoginController {

	
	@GetMapping("/member")
	public String LoginDto() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String () {
		
	}
}
 