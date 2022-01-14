package search;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ControllerConfig {
	
	@Bean
	public SearchController searchController() {
		return new SearchController();
	}
	
}
