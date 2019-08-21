package study.spring.hellospring.vo;

public class Calc3 {
	private value v;
	
	public Calc3(value v) {
		this.v = v;
	}
	public int sum() {
		return v.getX() + v.getY();
	}
}
