package login;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// search 패키지에도 있음, 따로할거면 유지, 그쪽으로 합칠것 같으면 삭제
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
		ds.setMaxIdle(10);
		
		return ds;
	}

	@Bean
	public LoginDao loginDao() {
		return new LoginDao(dataSource());
	}
}
