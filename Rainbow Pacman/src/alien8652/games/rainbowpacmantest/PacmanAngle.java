package alien8652.games.rainbowpacmantest;
//Essa classe serve para movimentar a boca do pacman e também mudar a sua direção 
//TODO> Criar uma classe "Pacman" com essa embutida
public class PacmanAngle{
	private float lastStartAngle=45,startAngle=45,sweepAngle=270,speed=8;
	private boolean openMouth=false;
	private int current_direction=31;
	public static final int LEFT=30,RIGHT=31,UP=32,DOWN=33;
	public void setMouthSpeed(float new_speed){speed=new_speed;}
	public float getMouthSpeed(){return speed;}
	public float getStartAngle(){return startAngle;}
	public float getSweepAngle(){return sweepAngle;}
	public void setDirection(int new_direction){
		current_direction=(new_direction>=30&&new_direction<=33)?new_direction:current_direction;
		float newStartAngle=current_direction==RIGHT?45:
			current_direction==LEFT?225:
			current_direction==DOWN?135:
			current_direction==UP?315:startAngle;
		lastStartAngle=startAngle-lastStartAngle;
		startAngle=lastStartAngle+newStartAngle;
		lastStartAngle=newStartAngle;

	}
	public int getDirection(){return current_direction;}
	public void update(){
		if(sweepAngle>=360||openMouth){
			startAngle+=speed;
			sweepAngle-=(speed*2);
			openMouth=!(sweepAngle<=270);
		}else{
			startAngle-=speed;
			sweepAngle+=(speed*2);
		}
	}
}
