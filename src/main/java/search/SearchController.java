package search;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	@GetMapping("/search")
	public String search(Model model,
			@RequestParam(value = "search word", defaultValue = "no word") String search_word) {
		SearchService service = new SearchService();
		// 검색어와 이름이 같은 상품을 찾아 상품 이름과 가격을 전달
		// 검색어와 카테고리가 맞는 상품을 찾아 상품 이름과 가격을 전달
		// 검색어와 세부카테고리와 맞는 상품을 찾아 상품 이름과 가격을 전달
		return "search";
	}
}
