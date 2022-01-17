package login;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import org.springframework.jdbc.core.RowMapper;

public class MemberMapper implements RowMapper<LoginDto> {

	@Override
	public LoginDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		LocalDateTime ldt = rs.getTimestamp("ldt").toLocalDateTime();
		
		LoginDto loginDto = new LoginDto(id, pw, ldt);
		loginDto.setId("id");
		
		return loginDto;
	}
}
