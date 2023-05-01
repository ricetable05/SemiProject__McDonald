package parksj.totalorder.model;

public class OrderDetailVO {

	private int odr_product_no;
	private int fk_odr_no;
	private int fk_item_no;
	private String item_name;
	private int item_price;
	private int quantity;
	private int is_set;
	
	
	private TotalOrderVO totalOrderVO;
	
	

	OrderDetailVO(){}
	
	OrderDetailVO(int odr_product_no, int fk_odr_no, int fk_item_no, String item_name, int item_price, int quantity, int is_set){
		
		this.odr_product_no = odr_product_no;
		this.fk_odr_no = fk_odr_no;
		this.fk_item_no = fk_item_no;
		this.item_name = item_name;
		this.item_price = item_price;
		this.quantity = quantity;
		this.is_set = is_set;
	}

	public int getOdr_product_no() {
		return odr_product_no;
	}

	public void setOdr_product_no(int odr_product_no) {
		this.odr_product_no = odr_product_no;
	}
	

	public int getFk_odr_no() {
		return fk_odr_no;
	}

	public void setFk_odr_no(int fk_odr_no) {
		this.fk_odr_no = fk_odr_no;
	}

	public int getFk_item_no() {
		return fk_item_no;
	}

	public void setFk_item_no(int fk_item_no) {
		this.fk_item_no = fk_item_no;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getIs_set() {
		return is_set;
	}

	public void setIs_set(int is_set) {
		this.is_set = is_set;
	}
	
	public TotalOrderVO getTotalOrderVO() {
		return totalOrderVO;
	}

	public void setTotalOrderVO(TotalOrderVO totalOrderVO) {
		this.totalOrderVO = totalOrderVO;
	}
	
	
}
