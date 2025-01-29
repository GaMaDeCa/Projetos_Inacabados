package GaMaDeCa.games.rainbowpacmantest;
import android.graphics.*;
//TODO> Desenhar um fantasma com olhos móveis
public class Fantasma{
	public Paint corpoPaint,olhosPaint,irisPaint;
	public float x,y,x2,y2;
	public Fantasma(){}
	public void draw(Canvas c){
		c.drawOval(x,y,x2,y2,corpoPaint);
	}
}
