package GaMaDeCa.Chart.Pie;

import android.app.*;
import android.os.*;
import android.view.*;
import android.content.*;
import android.graphics.*;
import android.widget.*;
import java.util.Random;
//Por favor deixe meus creditos no seu projeto se vc copiar o codigo das minhas classes
//Please let my credits in your project if you copy my class codes
//github.com/GaMaDeCa

//Pizza == Pie
public class MainActivity extends Activity {
	Button computaBtn;
	EditText valoresEditTxt;
	LinearLayout campoPizzaLL;
    ListaAdapter lista;
    ListView itensLstView;
	PizzaView pv;
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_activity);
		computaBtn=findViewById(R.id.computar);
		valoresEditTxt=findViewById(R.id.valores);
		campoPizzaLL=findViewById(R.id.campo_pizza);
        itensLstView=findViewById(R.id.itensListView);
        lista=new ListaAdapter(this,new Fatia[0]);
        itensLstView.setAdapter(lista);
		pv=new PizzaView(this);
		campoPizzaLL.addView(pv);
		computaBtn.setOnClickListener(new View.OnClickListener(){
			public void onClick(View v){
                String[] strArray=valoresEditTxt.getText().toString().split(",");
                if(strArray.length>0)
				    pv.computar(floatMap(strArray));
			}
		});
    }
    public float[] floatMap(String[] valores){
        float[] flts=new float[valores.length];
        for(int i=0;i<valores.length;i++){
            flts[i]=1;
            if(valores[i]=="0")
                continue;
            try{
                flts[i]=Float.parseFloat(valores[i]);
            }catch(Exception e){    
            }catch(Error er){
            }
            if(flts[i]<1)
                flts[i]=1;
        }
        return flts;
    }
	class PizzaView extends View{
		Pizza pizza=null;
		public PizzaView(Context ctx){
			super(ctx);
		}
		@Override
		protected void onDraw(Canvas canvas){
			if(pizza!=null){
                int w=getMeasuredWidth(),h=getMeasuredHeight();
                int min=Math.min(w,h);
                float x=0,y=0,x2=min,y2=min;
                float angle=0;
                for(Fatia fatia:pizza.fatias){
                    canvas.drawArc(x,y,x2,y2,angle,fatia.graus,true,fatia.cor);
                    angle+=fatia.graus;
                }
			}
			super.onDraw(canvas);
		}
		public void computar(float[] valores){
			pizza=new Pizza(valores);
            lista.update(pizza.fatias);
            lista.notifyDataSetChanged();
            invalidate();
		}
	}
    //Slice class
    class Fatia{
        float valor,porcentagem,graus;
        Paint cor;
        public Fatia(float Valor,float Porcentagem,float Grau,Paint Cor){
            valor=Valor;
            porcentagem=Porcentagem;
            cor=Cor;
            graus=Grau;
        }
    }
	class Pizza{
        Fatia[] fatias;//slices
		public Pizza(float[] Valores){//values
			float[] graus=ComputarGraus(Valores);//degrees
            float[] porcentagens=ComputarPorcentagens(Valores);//percentage
            fatias=new Fatia[Valores.length];
            for(int i=0;i<Valores.length;i++){
                fatias[i]=new Fatia(Valores[i],porcentagens[i],graus[i],getRandomColorPaint());
            }
		}
		public float[] ComputarGraus(float[] Valores){
			return EncaixarValores(Valores,360);
		}
        public float[] ComputarPorcentagens(float[] Valores){
            return EncaixarValores(Valores,100);
        }
        //"FitValuesIn" Method
        //where the "Encaixe" argument sets an range/limit(100% or 360°)
        //and the values will fit in this range(0-100 or 0-360)
        public float[] EncaixarValores(float[] Valores,int Encaixe){
            float[] Caixa=new float[Valores.length];
            float Total=Somar(Valores);
            for(int i=0;i<Valores.length;i++)
                Caixa[i]=(Valores[i]/Total)*Encaixe;
            return Caixa;
        }
		public float Somar(float[] Valores){
			float Soma=0;
			for(float Valor:Valores)
				Soma+=Valor;
			return Soma;
		}
        Random r=new Random();
        public Paint getRandomColorPaint(){
            return getPaint(Color.rgb(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
        }
        public Paint getPaint(int color){
            Paint p=new Paint();
            p.setStyle(Paint.Style.FILL);
            p.setColor(color);
            return p;
		}
	}
    class ListaAdapter extends BaseAdapter{
        Context ctx;
        Fatia[] pizza;
        public ListaAdapter(Context c,Fatia[] pz){
            ctx=c;
            update(pz);
        }
        public void update(Fatia[] pz){
          pizza=pz;
        }
        @Override
        public Object getItem(int p) {
            return pizza[p];
        }
        @Override
        public long getItemId(int p) {
            return pizza[p].cor.getColor();
        }
        @Override
        public int getCount() {
            return pizza.length;
        }
        @Override
        public View getView(int p,View view, ViewGroup gp) {
            if(view==null)
                view=gp.inflate(ctx,R.layout.item,null);
            View v=view.findViewById(R.id.itemCor);
            TextView tv=view.findViewById(R.id.itemInfo);
            v.setBackgroundColor(pizza[p].cor.getColor());
            StringBuilder sb=new StringBuilder();
            sb.append(pizza[p].valor);
            sb.append(" = ");
            String porcem=String.valueOf(pizza[p].porcentagem);
            porcem=porcem.substring(0,Math.min(5,porcem.length()));
            sb.append(porcem);
            sb.append("%");
            tv.setText(sb.toString());
            return view;
        }
    }
}
