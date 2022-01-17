package login;

import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

// 작성중 다른 방법이 있으면 변경필요
// 로그인을 위해 가져오는 값이 pw 하나뿐이니 굳이 List를 쓸 필요가 있을까
public class LoginDao {
	private JdbcTemplate jdbcTemplate;
	
	public LoginDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public LoginDto loginMember(String id) {
		String sql = "SELECT m_pw FROM memberinfo WHERE m_id = ?";
		
		List<LoginDto> rs = jdbcTemplate.query(sql, new MemberMapper(), id);
		
		return rs.isEmpty() ? null : rs.get(0);
	}

}
