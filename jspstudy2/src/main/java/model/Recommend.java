package model;

public class Recommend {
	private int num;
	private String id;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Recommend [num=" + num + ", id=" + id + "]";
	}
	
}
