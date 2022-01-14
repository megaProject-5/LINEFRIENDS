package search;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppCtx {
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		
		ds.setDriverClassName("org.mariadb.jdbc.Driver");
		ds.setUrl("jdbc:mariadb://localhost:3306/linefriends");
		ds.setName("root");
		ds.setPassword("0000");
		
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		
		return ds;		
	}
	
	@Bean
	public SearchDao searchDao() {
		return new SearchDao(dataSource());
	}
}
