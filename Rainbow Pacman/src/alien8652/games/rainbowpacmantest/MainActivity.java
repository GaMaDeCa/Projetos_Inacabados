package alien8652.games.rainbowpacmantest;
import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.app.AlertDialog;
import android.widget.EditText;
import android.text.InputType;
import android.content.DialogInterface;
import android.widget.*;
import android.view.*;
public class MainActivity extends Activity {
    PacmanGameView pacView;
	TextView cTV;
	@Override public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
		setContentView(R.layout.main);
		pacView=findViewById(R.id.pacView);
		Toast.makeText(this,"ISSO É APENAS UM TESTE DE PACMAN!\nNÃO É UM JOGO COMPLETO!",Toast.LENGTH_SHORT).show();
    }
	public void esq(View v){
		pacView.setDirecao(PacmanGameView.ESQUERDA);
	}
	public void cim(View v){
		pacView.setDirecao(PacmanGameView.CIMA);
	}
	public void dir(View v){
		pacView.setDirecao(PacmanGameView.DIREITA);
	}
	public void dow(View v){
		pacView.setDirecao(PacmanGameView.BAIXO);
	}
}
