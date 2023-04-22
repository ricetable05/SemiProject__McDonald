package jeonym.item.model;

public class ItemDetailVO {

	private int pk_fk_item_no;
	private String item_name; 
	private int weight_g;         
	private int weight_ml;         
	private int calories;         
	private int carbo;         
	private int protein;         
	private int fat;         
	private int sodium;         
	private int caffeine;         
	private int allergens; 
	private int coa;

	
	
	public ItemDetailVO() {}; // 생성자 오버로딩 시에는 기본생성자를 꼭 선언해야한다.
	
	public ItemDetailVO(int pk_fk_item_no, String item_name, int weight_g, int weight_ml, int calories, int carbo,
			int protein, int fat, int sodium, int caffeine, int allergens, int coa) {

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
	public int getWeight_g() {
		return weight_g;
	}
	public void setWeight_g(int weight_g) {
		this.weight_g = weight_g;
	}
	public int getWeight_ml() {
		return weight_ml;
	}
	public void setWeight_ml(int weight_ml) {
		this.weight_ml = weight_ml;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public int getCarbo() {
		return carbo;
	}
	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getSodium() {
		return sodium;
	}
	public void setSodium(int sodium) {
		this.sodium = sodium;
	}
	public int getCaffeine() {
		return caffeine;
	}
	public void setCaffeine(int caffeine) {
		this.caffeine = caffeine;
	}
	public int getAllergens() {
		return allergens;
	}
	public void setAllergens(int allergens) {
		this.allergens = allergens;
	}
	public int getCoa() {
		return coa;
	}
	public void setCoa(int coa) {
		this.coa = coa;
	} 
	
	
}
