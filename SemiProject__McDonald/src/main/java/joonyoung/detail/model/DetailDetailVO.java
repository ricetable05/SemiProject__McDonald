package joonyoung.detail.model;

public class DetailDetailVO {

	private int pk_fk_item_no;
	private String item_name; 
	private String weight_g;         
	private String  weight_ml;         
	private String calories;         
	private String carbo;         
	private String protein;         
	private float fat;         
	private String sodium;         
	private String caffeine;         
	private String allergens; 
	private String coa;

	
	
	public DetailDetailVO() {}; // 생성자 오버로딩 시에는 기본생성자를 꼭 선언해야한다.
	
	public DetailDetailVO(int pk_fk_item_no, String item_name, String  weight_g, String  weight_ml, String calories, String carbo,
			String protein, float fat, String sodium, String caffeine, String allergens, String coa) {

		this.pk_fk_item_no = pk_fk_item_no;
		this.item_name = item_name;
		this.weight_g = weight_g;
		this.weight_ml = weight_ml;
		this.calories = calories;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sodium = sodium;
		this.caffeine = caffeine;
		this.allergens = allergens;
		this.coa = coa;
		
	}
	public int getPk_fk_item_no() {
		return pk_fk_item_no;
	}
	public void setPk_fk_item_no(int pk_fk_item_no) {
		this.pk_fk_item_no = pk_fk_item_no;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getWeight_g() {
		return weight_g;
	}
	public void setWeight_g(String weight_g) {
		this.weight_g = weight_g;
	}
	public String getWeight_ml() {
		return weight_ml;
	}
	public void setWeight_ml(String weight_ml) {
		this.weight_ml = weight_ml;
	}
	public String getCalories() {
		return calories;
	}
	public void setCalories(String calories) {
		this.calories = calories;
	}
	public String getCarbo() {
		return carbo;
	}
	public void setCarbo(String carbo) {
		this.carbo = carbo;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}

	public float getFat() {
		return fat;
	}

	public void setFat(float fat) {
		this.fat = fat;
	}

	public String getSodium() {
		return sodium;
	}
	public void setSodium(String sodium) {
		this.sodium = sodium;
	}
	public String getCaffeine() {
		return caffeine;
	}
	public void setCaffeine(String caffeine) {
		this.caffeine = caffeine;
	}

	public String getAllergens() {
		return allergens;
	}

	public void setAllergens(String allergens) {
		this.allergens = allergens;
	}

	public String getCoa() {
		return coa;
	}

	public void setCoa(String coa) {
		this.coa = coa;
	}

	
	
}
