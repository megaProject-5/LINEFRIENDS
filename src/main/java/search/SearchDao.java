package search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class SearchDao {
	private JdbcTemplate jdbcTemplate;
	
	public SearchDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public Product SearchName(String word) {
		String sql ="SELECT * FROM product WHERE p_name = ? ";
		
		List<Product> rs = jdbcTemplate.query(sql, new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("p_name");
				int price = rs.getInt("p_price");
				
				Product product=new Product(name,price);
				
				return product;
			}
			
		}, word);
		return rs.isEmpty()? null:rs.get(0);// 수정 필요 -> 1개의 값만 가져오고있음
	}
}
