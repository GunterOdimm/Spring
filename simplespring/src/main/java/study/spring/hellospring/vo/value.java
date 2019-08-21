package study.spring.hellospring.vo;


/**
 * 간단한 JavaBeans
 */
public class value {
	private int x;
	private int y;
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	@Override
	public String toString() {
		return "value [x=" + x + ", y=" + y + "]";
	}
	
	
}
