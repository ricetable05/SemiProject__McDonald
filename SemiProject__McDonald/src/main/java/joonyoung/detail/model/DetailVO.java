package joonyoung.detail.model;


public class DetailVO {

	String item_info; // 제품 상세 설명 
	int item_no; // 아이템 번호 : auto increase   
	int fk_category_no; // 카테고리 번호        
	String item_name; // 제품명
	String item_image; // 제품 이미지명
	int item_price; // 제품 가격        
	int morning_availability; // 아침판매여부         
	int is_burger; // 버거 여부
	
	
	String categoryName; // select 용

	
	public DetailVO() {};
	
	public DetailVO(int item_no, int fk_category_no, String item_name, String item_image, int item_price,
			int morning_availability, int is_burger,  String item_info ) {

		this.item_no = item_no;
		this.fk_category_no = fk_category_no;
		this.item_name = item_name;
		this.item_image = item_image;
		this.item_price = item_price;
		this.morning_availability = morning_availability;
		this.is_burger = is_burger;
		this.item_info = item_info;
		
	}
	
	

	
	
	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getFk_category_no() {
		return fk_category_no;
	}

	public void setFk_category_no(int fk_category_no) {
		this.fk_category_no = fk_category_no;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getMorning_availability() {
		return morning_availability;
	}

	public void setMorning_availability(int morning_availability) {
		this.morning_availability = morning_availability;
	}

	public int getIs_burger() {
		return is_burger;
	}

	public void setIs_burger(int is_burger) {
		this.is_burger = is_burger;
	}

	public String getItem_info() {
		return item_info;
	}

	public void setItem_info(String item_info) {
		this.item_info = item_info;
	}



	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	
	
	

	
}
