package parksj.menu.model;

public class ItemVO {

	
	int item_no;
	int fk_category_no; // 카테고리 번호
	String item_name;
	String item_image;
	
	private CategoryVO catevo;


	public ItemVO() {};
	
	public ItemVO(int item_no, int fk_category_no, String item_name, String item_image) {

		this.item_no = item_no;
		this.fk_category_no = fk_category_no;
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

	public int getFk_category_no() {
		return fk_category_no;
	}

	public void setFk_category_no(int fk_category_no) {
		this.fk_category_no = fk_category_no;
	}
	
	public CategoryVO getCatevo() {
		return catevo;
	}

	public void setCatevo(CategoryVO catevo) {
		this.catevo = catevo;
	}
	
	

	
}
