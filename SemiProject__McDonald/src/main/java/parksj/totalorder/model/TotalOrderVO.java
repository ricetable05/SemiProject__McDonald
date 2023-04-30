package parksj.totalorder.model;

public class TotalOrderVO {
	
	private int odr_no; // 주문번호
	private String fk_userid;// 회원아이디
	private String fk_store_id;// 매장코드
	private int is_delivery;//배달상태
	private String delivery_time;//배달완료시간
	private String odr_date;//주문일자
	private int is_delivery_price;//배달비여부
	
	
	TotalOrderVO(){}
	
	TotalOrderVO(int odr_no, String fk_userid, String fk_store_id, int is_delivery, String delivery_time, String odr_date, int is_delivery_price){
		this.odr_no = odr_no;
		this.fk_userid = fk_userid;
		this.fk_store_id = fk_store_id;
		this.is_delivery = is_delivery;
		this.delivery_time = delivery_time;
		this.odr_date = odr_date;
		this.is_delivery_price = is_delivery_price;
		
	}

	public int getOdr_no() {
		return odr_no;
	}

	public void setOdr_no(int odr_no) {
		this.odr_no = odr_no;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getFk_store_id() {
		return fk_store_id;
	}

	public void setFk_store_id(String fk_store_id) {
		this.fk_store_id = fk_store_id;
	}

	public int getIs_delivery() {
		return is_delivery;
	}

	public void setIs_delivery(int is_delivery) {
		this.is_delivery = is_delivery;
	}

	public String getDelivery_time() {
		return delivery_time;
	}

	public void setDelivery_time(String delivery_time) {
		this.delivery_time = delivery_time;
	}

	public String getOdr_date() {
		return odr_date;
	}

	public void setOdr_date(String odr_date) {
		this.odr_date = odr_date;
	}

	public int getIs_delivery_price() {
		return is_delivery_price;
	}

	public void setIs_delivery_price(int is_delivery_price) {
		this.is_delivery_price = is_delivery_price;
	}
	
	

}
