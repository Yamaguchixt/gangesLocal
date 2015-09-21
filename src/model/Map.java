package model;

public class Map {
	public double mapPoint;
	public int x;
	public int y;
	public String drawData;
	public String objectData;
	public String collisionData;
	public String imagePath;

	public Map(){};
	public void setPoint(double point){
		this.x = (int)point;
		this.y = (int)(point*10) % 10;
		this.mapPoint = point;
	}

}
