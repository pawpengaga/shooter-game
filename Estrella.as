package{
	
import flash.display.MovieClip;
import fl.transitions.Tween;
import fl.transitions.easing.*;
import flash.events.MouseEvent;
import fl.transitions.TweenEvent;

    public class Estrella extends satelitee{

        private var simbolo:MovieClip;
        private var mov_vertical:Tween;
        private var mov_rotacion:Tween;
        private var mov_alpha:Tween;
		
        public function Estrella(objeto1:MovieClip){
            this.simbolo = objeto1;
            this.simbolo.addChild(this);
            this.x = 512;
            this.y = 800;

            mov_vertical = new Tween(this,"y", Regular.easeOut,this.y,-100,3,true);
            mov_vertical.addEventListener(TweenEvent.MOTION_FINISH,repetir_mov_vertical);
            mov_rotacion = new Tween(this, "rotation", Regular.easeOut,0,359,3,true);
            mov_rotacion.addEventListener(TweenEvent.MOTION_FINISH,repetir_mov_rotacion);
            mov_alpha = new Tween(this, "alpha", Regular.easeOut,this.alpha,0,0.5,true);
            mov_alpha.addEventListener(TweenEvent.MOTION_FINISH,repetir_mov_alpha);

            this.simbolo.swapChildren(this,this.simbolo.nuevo_puntero);
			
        }
    
        private function repetir_mov_vertical(event_TweenEvent):void{
            mov_vertical.yoyo();
            
        }
        private function repetir_mov_rotacion(event_TweenEvent):void{
            mov_rotacion.start();
            
        }
        private function repetir_mov_alpha(event_TweenEvent):void{
            mov_alpha.yoyo();
            
        }
    }
	
}
