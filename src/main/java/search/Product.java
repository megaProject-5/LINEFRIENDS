package search;

// 검색을 했을 때 데이터베이스에서 찾은 정보를 저장하고 화면에 뛰워줄건데 저장하는 공간
public class Product {
	String name;
	int price;
	
	public Product(String name, int price) {
		this.name=name;
		this.price=price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
