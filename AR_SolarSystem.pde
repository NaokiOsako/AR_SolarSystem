import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
float theta=0.1;
void setup() {
    size(640,480,P3D);
    colorMode(RGB, 100);
    println(MultiMarker.VERSION);
    cam=new Capture(this,640,480,30);
    nya=new MultiMarker(this,width,height,"camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
    nya.addARMarker("patt.hiro",80);
    cam.start();


}
//太陽系　作る
void draw()
{
    if (cam.available() !=true) {
        return;
    }
    cam.read();
    set(0,0,cam);
    nya.detect(cam);
    if((!nya.isExistMarker(0))){
        return;
    }
    nya.beginTransform(0);
    //太陽
    fill(255,255,255);
    sphere(100);
    //水星
    fill(80,169,214);
    translate(180*sin(theta),180*cos(theta),0);
    sphere(20);

    //金星
    fill(197,175,50);
    translate(220*sin(theta+1.5),220*cos(theta+1.5),0);
    sphere(30);
    
    //地球
    fill(35,15,278);
    translate(330*sin(theta-1.5),330*cos(theta-1.5),0);
    sphere(40);
    
    //火星
    fill(229,0,11);
    translate(500*sin(theta+3),500*cos(theta+3),0);
    sphere(35);

    //木星
    fill(119, 70, 53 );
    translate(330*sin(theta-3),330*cos(theta-3),0);
    sphere(50);
    
    
    
    
    
 
    theta= theta+0.1;
 
       nya.endTransform();
/*    if(i==1){
        dx= dx+10;
        if(dx>=250) i=-1;
    }
    else{
        dx= dx-10;
        if(dx<=30) i=1;
    }
  */  
    
}