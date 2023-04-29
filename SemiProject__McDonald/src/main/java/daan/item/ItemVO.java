package daan.item;

public class ItemVO {

	private int item_no;
	private int fk_category_no;
	private String item_name;
	private String item_image;
	private int item_price;
	private int morning_availability;
	private int is_burger;
	private String item_info;

	////////////////////////////////////////
	
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
}
