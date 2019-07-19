package  {
import flash.display.MovieClip;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import flash.events.MouseEvent;
import fl.transitions.TweenEvent;
import flash.media.SoundChannel;
import flash.events.Event;
import flash.utils.Timer;
	
	public class toha1 extends toha_1{
	
    private var sakuya:MovieClip;
	private var mov_horizontal_sakuya:Tween;
    private var tiempo_estrella:Timer;


        public function toha1(objeto2:MovieClip){
            this.sakuya = objeto2;
            this.sakuya.addChild(this);
            this.x = -99.35;
            this.y = Math.round(Math.random()*800);

            mov_horizontal_sakuya = new Tween(this,"x", Regular.easeInOut,this.x,1400,5,true);
            
            mov_horizontal_sakuya.addEventListener(TweenEvent.MOTION_FINISH,repetir_mov_sakuya);

            this.sakuya.swapChildren(this,this.sakuya.nuevo_puntero);
            this.sakuya.nuevo_puntero.addEventListener(MouseEvent.CLICK,matar_sakuya);
            
            this.sakuya.swapChildren(this,this.sakuya.nueva_estrella);

            this.tiempo_estrella = new Timer(10);
            this.tiempo_estrella.addEventListener("timer",choque_estrella);
            this.tiempo_estrella.start();
        }

					private function choque_estrella(event:Event):void{
					if(this.hitTestObject(this.sakuya.nueva_estrella)){
					this.gotoAndPlay("hit_1");
			
					this.sakuya.puntaje = this.sakuya.puntaje - Math.round(Math.random()*1);
					this.sakuya.puntaje_texto.text = String(this.sakuya.puntaje);
				
						if (this.sakuya.puntaje < -500){
						var perder:derrota = new derrota();
						this.addChild(perder);
						perder.x = 100;
						perder.y = 100;
						this.sakuya.tiempo.stop();
				}
			}
		}

            private function repetir_mov_sakuya(event:TweenEvent):void{
            mov_horizontal_sakuya.yoyo();
            
        }
            //Funcion para generar toda la muerte de enemigos
            private function matar_sakuya(event:MouseEvent):void{
            if(this.hitTestObject(this.sakuya.nuevo_puntero)){
            this.gotoAndPlay("hit_1");
///////////////////////////////////////////////////
            var sonido_explota:explosion = new explosion();
			var canal:SoundChannel = sonido_explota.play();
            this.sakuya.puntaje = this.sakuya.puntaje + Math.round(Math.random()*60);
            this.sakuya.puntaje_texto.text = String(this.sakuya.puntaje);


            if (this.sakuya.puntaje > 250){
                var ganar:triunfo = new triunfo();
                this.addChild(ganar);
                ganar.x= 632.1;
                ganar.y = 64.95;
                this.sakuya.nueva_estrella.gotoAndPlay("cheat");
                this.sakuya.tiempo.stop();
                this.sakuya.tiempo2.stop();
                this.sakuya.tiempo3.stop();
                }
            }
        }
	}
}
