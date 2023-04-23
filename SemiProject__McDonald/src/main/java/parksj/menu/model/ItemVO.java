package parksj.menu.model;

public class ItemVO {

	
	int item_no;   
	String item_name;
	String item_image;
	String categoryName;

	
	public ItemVO() {};
	
	public ItemVO(int item_no, String item_name, String item_image) {

		this.item_no = item_no;
		this.item_name = item_name;
		this.item_image = item_image;
		
	}
	
	

	
	
	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
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
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

	
}
