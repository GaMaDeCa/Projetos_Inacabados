package GaMaDeCa.games.rainbowpacmantest;
import android.content.Context;
import android.view.View;
import java.util.Random;
import android.util.AttributeSet;
import android.view.View.*;
import android.graphics.*;
import java.util.*;
public class PacmanGameView extends View {
    private Paint pacPaint,bordaPaint,limitesPaint,comidaPaint;
	private final int COR_PACMAN=Color.YELLOW,
					  COR_BORDA=Color.CYAN,
					  COR_LIMITE=Color.BLUE,
					  COR_COMIDA=0xffffa800,
					  COR_FUNDO=Color.BLACK,
					  COR_FANTASMA=0xaaff0000;

	public int DIRECAO;
	public static final int BAIXO=0,CIMA=1,ESQUERDA=2,DIREITA=3;
	private float largura,altura;
	private PacmanAngle pacmanAngle=null;
	private float pacX=150,pacY=150,pacRaio,pacVeloz=6;

	private Fantasma fantasma;
	private int DIRECAO_FANTASMA,MOVES_FANTASMA,fanVeloz=7;
	private final int MAX_MOVES_FANTASMA=80;
	
	private int pontos=0;
	
	private boolean iniciado=false;
	public PacmanGameView(Context ctx){super(ctx);}
	public PacmanGameView(Context ctx,AttributeSet attrs){super(ctx,attrs);}
	private void iniciar(){
		pacPaint=newPaint(COR_PACMAN);
		//Descomente para o PacMan ficar colorido em gradiente ou recomente para voltar a ser amarelo.
		pacPaint.setShader(new SweepGradient(largura/2,altura/2,new int[]{0xffff0000,0xffffff00,0xff00ff00,0xff00ffff,0xff0000ff,0xffff00ff,0xffff0000},null));
		/*bordaPaint=newPaint(COR_BORDA,S);
		bordaPaint.setStrokeWidth(4);*/
		limitesPaint=newPaint(COR_LIMITE,S);
		limitesPaint.setShader(new SweepGradient(largura/2,altura/2,new int[]{0xffff0000,0xffffff00,0xff00ff00,0xff00ffff,0xff0000ff,0xffff00ff,0xffff0000},null));
		bordaPaint=limitesPaint;
		comidaPaint=newPaint(COR_COMIDA);
		
		pacX=largura/2;
		pacRaio=((largura+altura)/100)*2;
		pacY=altura-(pacRaio*2);
		
		pacmanAngle=new PacmanAngle();
		pacmanAngle.setMouthSpeed(4);
		setDirecao(DIREITA);
		
		fantasma=new Fantasma();
		fantasma.corpoPaint=newPaint(COR_FANTASMA);
		
		iniciado=true;
	}
	@Override protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);
		largura=getMeasuredWidth();
		altura=getMeasuredHeight();
		if(!iniciado)iniciar();

		canvas.drawColor(COR_FUNDO);
		canvas.drawRect(1,1,largura-1,altura-1,bordaPaint);

		gerarMapa(canvas);
		atualizarJogo();

		fantasma.draw(canvas);
		canvas.drawArc(pacX-pacRaio,pacY-pacRaio,
					   pacX+pacRaio,pacY+pacRaio,
					   pacmanAngle.getStartAngle(),pacmanAngle.getSweepAngle(),
					   true,pacPaint);

		invalidate();
	}
	private ArrayList<Float[]> limites=null;
	private ArrayList<Float[]> comidas=null;
	private boolean limitesDefinidos=false;
	private static final int[][]mapa=Mapa.mapaOriginal;
	private void gerarMapa(Canvas c){
		if(!limitesDefinidos){
			limites=new ArrayList<Float[]>();
			comidas=new ArrayList<Float[]>();
		}
		int iComida=0;
		/*wC e hC são acumuladores de w e h,
		  servem para redimensionar na escala
		  correta cada item do mapa ao desenhar,
		  vamos supor que o tamanho da tela(altura)
		  é 1000 e no mapa tem 10 subarrays, nesse caso
		  o 1000 é divido pela "altura" do mapa em subarrays
		  o que dá o tamanho exato para caber na tela cada item
		  do mapa(h=1000/10=100), então cada item terá 100 de altura
		  e se não existir qualquer item nas constantes o acumulador continua
		  aumentando da mesma maneira mas sem desenhar nada(para dar o espaçamento entre os itens).
		*/
		float w,wC,
			  h=altura/mapa.length,hC=0;
		Path lims=new Path();
		for(int y=0;y<mapa.length;y++){
			w=largura/mapa[y].length;
			wC=0;
			for(int x=0;x<mapa[y].length;x++){
				switch(mapa[y][x]){
					case Mapa.BLOCO:
						Float[]f=new Float[]{wC,hC,wC+w,hC+h};
						lims.addRect(f[0],f[1],f[2],f[3],Path.Direction.CW);
						//c.drawRect(f[0],f[1],f[2],f[3],limitesPaint);//Mudado para um único Path
						if(!limitesDefinidos)
							limites.add(f);
						break;
					case Mapa.PAC:
						if(!limitesDefinidos){
							pacRaio=Math.min(h,w)/2-4;
							pacX=wC+pacRaio;
							pacY=hC+pacRaio+3;
						}
						break;
					case Mapa.COMIDA:
						Float[]fC=null;
						if(!limitesDefinidos){
							fC=new Float[]{wC+(w/2),hC+(h/2)+3,Math.min(h,w)/8};
							comidas.add(fC);
						}else if(comidas!=null){
							fC=comidas.get(iComida);
							iComida+=1;
						}
						if(fC!=null)
							c.drawCircle(fC[0],fC[1],fC[2],comidaPaint);
						break;
					case Mapa.FANTASMA:
						if(!limitesDefinidos){
							int dim=4;
							fantasma.x=wC+dim;
							fantasma.y=hC+dim;
							fantasma.x2=wC+w-dim;
							fantasma.y2=hC+h-dim;
							DIRECAO_FANTASMA=getDirecaoAleatoria();
							MOVES_FANTASMA=0;
						}
						break;
					default:
						break;
				}
				wC+=w;
			}
			hC+=h;
		}
		c.drawPath(lims,limitesPaint);
		if(!limitesDefinidos)limitesDefinidos=true;
	}
	//Aqui se verifica principalmente as colisões do pacman, mas eu adicionei tbm as colisões de um fantasma
	public void atualizarJogo(){
		pacmanAngle.update();
		float novoX=DIRECAO==ESQUERDA?pacX-pacVeloz:DIRECAO==DIREITA?pacX+pacVeloz:pacX,
			  novoY=DIRECAO==CIMA?pacY-pacVeloz:DIRECAO==BAIXO?pacY+pacVeloz:pacY;
		float cx=novoX+pacRaio,cx2=novoX-pacRaio,
			  cy=novoY+pacRaio,cy2=novoY-pacRaio;
		//********FANTASMA VERMELHO↓
		float fanX=fantasma.x,fanY=fantasma.y,fanX2=fantasma.x2,fanY2=fantasma.y2;
		switch(DIRECAO_FANTASMA){
			case ESQUERDA:
				fanX-=fanVeloz;
				fanX2-=fanVeloz;
				break;
			case DIREITA:
				fanX+=fanVeloz;
				fanX2+=fanVeloz;
				break;
			case CIMA:
				fanY-=fanVeloz;
				fanY2-=fanVeloz;
				break;
			case BAIXO:
				fanY+=fanVeloz;
				fanY2+=fanVeloz;
				break;
			default:
				break;
		}
		float fanDif=0;
		if(fanX<0){
			fanDif=-fanX;
			fanX2=fanDif;
			fanX=0;
		}else if(fanX2>largura){
			fanDif=fanX2-largura;
			fanX-=fanDif;
			fanX2-=fanDif;
		}
		if(fanY<0){
			fanDif=-fanY;
			fanY2=fanDif;
			fanY=0;
		}else if(fanY2>altura){
			fanDif=fanY2-altura;
			fanY-=fanDif;
			fanY2-=fanDif;
		}
		//********FANTASMA VERMELHO↑
		//Checar colisão com o fim da tela
		novoX=cx>=largura?largura-pacRaio:cx2<=0?pacRaio:novoX;
		novoY=cy>=altura?altura-pacRaio:cy2<=0?pacRaio:novoY;
		//Checar colisão com todas as paredes e comidas
		if(limites!=null){
			float cr2=pacRaio*2;
			cx-=cr2;
			cx2+=cr2;
			cy-=cr2;
			cy2+=cr2;
			for(int i=0;i<limites.size();i++){
				Float[] f=limites.get(i);
				float fx=f[0],fy=f[1],fx2=f[2],fy2=f[3];
	
				//Colisão PacMan(Caso bata as novas coordenadas continuarão sendo as antigas)
				boolean c1=cx2>=fx,c2=cx<=fx2,
						c3=cy2>=fy,c4=cy<=fy2;
				if((c1&&c2)&&(c3&&c4)){
					novoX=pacX;
					novoY=pacY;
				}
				
				//Colisão Fantasma(O mesmo do pacman, com diferencial de mudar a direção aleatóriamente)
				if((fanX2>fx&&fanX<fx2)&&(fanY2>fy&&fanY<fy2)){
					fanX=fantasma.x;
					fanY=fantasma.y;
					fanX2=fantasma.x2;
					fanY2=fantasma.y2;
					DIRECAO_FANTASMA=getDirecaoAleatoria();
				}
			}
			if(comidas!=null){
				for(int i=0;i<comidas.size();i++){
					Float[] f=comidas.get(i);
					if(f!=null){
						float fx=f[0]-f[2],fy=f[1]-f[2],fx2=f[0]+f[2],fy2=f[1]+f[2];
						boolean c1=cx2>=fx,c2=cx<=fx2,
								c3=cy2>=fy,c4=cy<=fy2;
						if((c1&&c2)&&(c3&&c4)){
							comidas.set(i,null);//Comida fica nula e ponto aumenta
							pontos+=1;
						}
					}
				}
			}
		}
		//Move o pacman nas coordenadas permitidas(depois de verificar colisões, etc)
		pacX=novoX;
		pacY=novoY;
		//Move o fantasma e a cada 80 movimentos muda pra uma direção aleatória
		if(fantasma.x!=fanX&&fantasma.y!=fanY&&fantasma.x2!=fanX2&&fantasma.y2!=fanY2){
			MOVES_FANTASMA+=1;
			if(MOVES_FANTASMA>=MAX_MOVES_FANTASMA){
				DIRECAO_FANTASMA=getDirecaoAleatoria();
				MOVES_FANTASMA=0;
			}
		}
		fantasma.x=fanX;
		fantasma.y=fanY;
		fantasma.x2=fanX2;
		fantasma.y2=fanY2;
	}
	public void setDirecao(int novaDirecao){
		DIRECAO=novaDirecao;
		atualizaDirecao();
	}
	//Endireita corretamente a "boca" do pacman
	public void atualizaDirecao(){
		switch(DIRECAO){
			case DIREITA:
				pacmanAngle.setDirection(PacmanAngle.RIGHT);
				break;
			case ESQUERDA:
				pacmanAngle.setDirection(PacmanAngle.LEFT);
				break;
			case CIMA:
				pacmanAngle.setDirection(PacmanAngle.UP);
				break;
			case BAIXO:
				pacmanAngle.setDirection(PacmanAngle.DOWN);
				break;
			default:
				break;
		}
	}
	public int getDirecaoAleatoria(){return new Random().nextInt(4);}
	//Métodos para criação rápida de Paint's
	private static final Paint.Style F=Paint.Style.FILL,S=Paint.Style.STROKE,FS=Paint.Style.FILL_AND_STROKE;
	private Paint newPaint(int cor){
		return newPaint(cor,F);
	}
	private Paint newPaint(int cor,Paint.Style estilo){
		Paint paint=new Paint();
		paint.setStyle(estilo);
		paint.setColor(cor);
		return paint;
	}
}
