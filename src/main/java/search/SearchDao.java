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
	
	public void insertDibs() {
		// 상품을 위시리스트에 넣는 메서드
		String sql = "INSERT INTO wishlist(m_value,p_value) VALUES(?,?) ";
	}
	
	public void deleteDibs() {
		// 위시리스트에 넣은 상품 빼기
		String sql = "DELETE FROM wishlist ";
	}
}
