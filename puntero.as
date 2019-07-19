//package y librería son lo mismo
package  {

	import flash.display.*; // Son los guis ahhhhhhhhhh
	import flash.ui.*;	// Son los guis ahhhhhhhhhh
	import flash.events.MouseEvent;

//Ahhhh es como igual que java ahhhhhjj	
//Lo de abajo es vincular el objeto de biblioteca a la clase
//La clase puntero es una extensión de mira, eso quiere decir que se va a dibujar a través del objeto
	public class puntero extends mira { 

		public function puntero(objeto:MovieClip) {
			// constructor code
			objeto.addChild(this);
			Mouse.hide(); //Mata el mouse para que solo se vea el puntero especial
			objeto.stage.addEventListener(MouseEvent.MOUSE_MOVE,mover); //Con stage solo se mueve en el marco del juego
			//Con esto se capta la posición del cursor cada vez que se mueva
		}

		
		private function mover(event:MouseEvent):void{

			this.x = event.stageX;
			this.y = event.stageY;
		//Las coordenadas actuales de X,Y se le entregan al objeto this, especificado en el addChild
		}

	}
	//Como se esta dentro de una clase se tiene que especificar si la función es privada o pública
}
