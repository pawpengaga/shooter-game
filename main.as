//Programar mira

import puntero; //Ahhhh es la libreria que hice ahhhhhhhhhhhh
import Estrella;
import toha1;
import toha2;
import toha3;
import flash.utils.Timer;
import flash.events.Event;
import fl.controls.Label;
import flash.events.MouseEvent;

var nuevo_puntero:puntero = new puntero(this);

var nueva_estrella:Estrella = new Estrella(this);

var nueva_toha1:toha1;
var nueva_toha2:toha2;
var nueva_toha3:toha3;

///////////////////


//22/11/2018

//un pinshe temporizador para generar los enemigos ahhhhhhhhhh
var tiempo:Timer = new Timer(2900);
var tiempo2:Timer = new Timer(3700);
var tiempo3:Timer = new Timer(4900); //Los parentesis son milisegundos

var puntaje_texto:TextField = new TextField();
var puntajito:TextFormat = new TextFormat;
var puntaje:Number = 0;

var titulx:TextField = new TextField();
var formatitulx:TextFormat = new TextFormat;

formatitulx.size = 55;
formatitulx.bold = true;
formatitulx.color =  0xFFFFFF;
formatitulx.italic = false; 
formatitulx.font = "Century Gothic";

puntajito.size = 35;
puntajito.bold = true;
puntajito.color =  0xFFFFFF;
puntajito.italic = false; 
puntajito.font = "Century Gothic";

titulx.defaultTextFormat = formatitulx;
addChild(titulx);
titulx.x = 540;
titulx.y = 640;
titulx.width = 720;
titulx.text = "Touhou Shooting Simulator";

puntaje_texto.defaultTextFormat = puntajito;
addChild(puntaje_texto);
puntaje_texto.x=70.9;
puntaje_texto.y = 628;
puntaje_texto.text = String(puntaje);

tiempo.addEventListener("timer", crear_toha_1);
tiempo2.addEventListener("timer", crear_toha_2);
tiempo3.addEventListener("timer", crear_toha_3); //Espera a que se cumpla el timer para ejecutar la funcion de abajo

//Encender el temporizador
tiempo.start();
tiempo2.start();
tiempo3.start();

function crear_toha_1(event:Event):void{

    nueva_toha1 = new toha1(this);

}

function crear_toha_2(event:Event):void{

    nueva_toha2 = new toha2(this);

}

function crear_toha_3(event:Event):void{

    nueva_toha3 = new toha3(this);

}
