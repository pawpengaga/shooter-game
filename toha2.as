package  {
import flash.display.MovieClip;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import flash.events.MouseEvent;
import fl.transitions.TweenEvent;
import flash.media.SoundChannel;
import flash.events.Event;
import flash.utils.Timer;
	
	public class toha2 extends toha_2{

		    private var youmu:MovieClip;
			private var mov_horizontal_youmu:Tween;
            private var tiempo_estrella:Timer;

		public function toha2(objeto3:MovieClip){
            this.youmu = objeto3;
            this.youmu.addChild(this);
            this.x = -99.35;
            this.y = Math.round(Math.random()*800);

            mov_horizontal_youmu = new Tween(this,"x", Regular.easeInOut,this.x,1400,4,true);
            mov_horizontal_youmu.addEventListener(TweenEvent.MOTION_FINISH,repetir_mov_youmu);

            this.youmu.swapChildren(this,this.youmu.nuevo_puntero);

            //Destruccion de enemigo ahhhhhh
            this.youmu.nuevo_puntero.addEventListener(MouseEvent.CLICK,matar_youmu);
            this.youmu.swapChildren(this,this.youmu.nueva_estrella);
            this.tiempo_estrella = new Timer(10);
            this.tiempo_estrella.addEventListener("timer",choque_estrella);
            this.tiempo_estrella.start();
        }

					private function choque_estrella(event:Event):void{
					if(this.hitTestObject(this.youmu.nueva_estrella)){
					this.gotoAndPlay("hit_2");
			
					this.youmu.puntaje = this.youmu.puntaje - Math.round(Math.random()*1);
					this.youmu.puntaje_texto.text = String(this.youmu.puntaje);
				
						if (this.youmu.puntaje < -500){
						var perder:derrota = new derrota();
						this.addChild(perder);
						perder.x = 100;
						perder.y = 100;
						this.youmu.tiempo2.stop();
				}
			}
		}
            private function repetir_mov_youmu(event_TweenEvent):void{
            mov_horizontal_youmu.yoyo();
            
        }

        private function matar_youmu(event:MouseEvent):void{
            if(this.hitTestObject(this.youmu.nuevo_puntero)){

            this.gotoAndPlay("hit_2");
            var sonido_explota:explosion = new explosion();
			var canal:SoundChannel = sonido_explota.play();
            this.youmu.puntaje = this.youmu.puntaje + Math.round(Math.random()*80);
            this.youmu.puntaje_texto.text = String(this.youmu.puntaje);


            if (this.youmu.puntaje > 250){
                var ganar:triunfo = new triunfo();
                this.addChild(ganar);
                ganar.x= 632.1;
                ganar.y = 64.95;
                this.youmu.nueva_estrella.gotoAndPlay("cheat");
                this.youmu.tiempo.stop();
                this.youmu.tiempo2.stop();
                this.youmu.tiempo3.stop();
                }
            }
        }
	}
	
}
