package search;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MvcController {
	AnnotationConfigApplicationContext ctx = 
			new AnnotationConfigApplicationContext(ControllerConfig.class);
	
	@GetMapping("/search")
	public Product search(Model model,
			@RequestParam(value = "search word", defaultValue = "no word") String search_word) {
		// jsp에서 보내줄 파라미터의 name을 search word라고 함.
		SearchDao dao = ctx.getBean("searchDao",SearchDao.class);
		Product product = dao.SearchName(search_word);
		
		return product;
	}
	
	@GetMapping("/dibs/insert")
	public void insertDibs() {
		
	}
}
