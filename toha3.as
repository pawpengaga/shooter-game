package  {
import flash.display.MovieClip;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import flash.events.MouseEvent;
import fl.transitions.TweenEvent;
import flash.media.SoundChannel;
import flash.events.Event;
import flash.utils.Timer;
	
	public class toha3 extends toha_3{

		    private var yuuka:MovieClip;
			private var mov_vertical_yuuka:Tween;
            private var tiempo_estrella:Timer;
            

		public function toha3(objeto4:MovieClip){
            this.yuuka = objeto4;
            this.yuuka.addChild(this);
            this.x = 1400; //
            this.y = Math.round(Math.random()*800);

            mov_vertical_yuuka = new Tween(this,"x", Regular.easeInOut,this.x,-101.2,6,true);
            mov_vertical_yuuka.addEventListener(TweenEvent.MOTION_FINISH,repetir_mov_yuuka);

            this.yuuka.swapChildren(this,this.yuuka.nuevo_puntero); //Hacer que un objeto esté sobre otro, MUY IMPORTANTE
            this.yuuka.nuevo_puntero.addEventListener(MouseEvent.CLICK,matar_yuuka);

            this.yuuka.swapChildren(this,this.yuuka.nueva_estrella);

            this.tiempo_estrella = new Timer(10);
            this.tiempo_estrella.addEventListener("timer",choque_estrella);
            this.tiempo_estrella.start();
        }
        			private function choque_estrella(event:Event):void{
					if(this.hitTestObject(this.yuuka.nueva_estrella)){
					this.gotoAndPlay("hit_3");
			
					this.yuuka.puntaje = this.yuuka.puntaje - Math.round(Math.random()*1);
					this.yuuka.puntaje_texto.text = String(this.yuuka.puntaje);
				
						if (this.yuuka.puntaje < -500){
						var perder:derrota = new derrota();
						this.addChild(perder);
						perder.x = 100;
						perder.y = 100;
						this.yuuka.tiempo3.stop();
				}
			}
		}
            private function repetir_mov_yuuka(event_TweenEvent):void{
            mov_vertical_yuuka.yoyo();
            
        }

            private function matar_yuuka(event:MouseEvent):void{

            if(this.hitTestObject(this.yuuka.nuevo_puntero)){

            this.gotoAndPlay("hit_3");
            var sonido_explota:explosion = new explosion();
			var canal:SoundChannel = sonido_explota.play();
            this.yuuka.puntaje = this.yuuka.puntaje + Math.round(Math.random()*50);
            this.yuuka.puntaje_texto.text = String(this.yuuka.puntaje);


            if (this.yuuka.puntaje > 250){
                var ganar:triunfo = new triunfo();
                this.addChild(ganar);
                ganar.x= 632.1;
                ganar.y = 64.95;
                this.yuuka.nueva_estrella.gotoAndPlay("cheat");
                this.yuuka.tiempo.stop();
                this.yuuka.tiempo2.stop();
                this.yuuka.tiempo3.stop();
                }
            }
        }
	}
	
}
