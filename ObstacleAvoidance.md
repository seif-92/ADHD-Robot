# Running-Alarm-Robot
///
#include<SoftwareSerial.h>

#include <LiquidCrystal_I2C.h>
#include <Wire.h> 
#include <ThreeWire.h>
#include <RtcDS1302.h>



LiquidCrystal_I2C lcd(0x27, 16, 2);
ThreeWire myWire(2,3,4); 
RtcDS1302<ThreeWire> Rtc(myWire);

#define speedL 10
#define IN1 9
#define IN2 8
#define IN3 7
#define IN4 6
#define speedR 5
#define trig2 2
#define echo2 3
#define trig 11
#define echo 4
#define buzzer 13
#define flame 12

long duration,distance,duration1,distance1;
int val=0;



void setup() 
{  
  Serial.begin(9600);
  for(int i=5;i<=12;i++)
  {
    pinMode (i,OUTPUT);
  }
  
  pinMode (echo,INPUT);
  
  lcd.init();
  lcd.backlight();
  lcd.clear();
 
  Rtc.Begin();
 // RtcDateTime currentTime = RtcDateTime(__DATE__,__TIME__);
  //Rtc.SetDateTime(currentTime);
  tone(12,277);

  

  
}

void Ultrasonic()
{
  digitalWrite(trig,LOW);

  delayMicroseconds(2);
  
  digitalWrite(trig,HIGH);
  
  delayMicroseconds(10);
  
  digitalWrite(trig,LOW);

   digitalWrite(trig2,LOW);

  delayMicroseconds(2);
  
  digitalWrite(trig2,HIGH);
  
  delayMicroseconds(10);
  
  digitalWrite(trig2,LOW);
  duration=pulseIn(echo,HIGH);
  distance=(duration/2)*0.0343;

  duration1=pulseIn(echo2,HIGH);
  distance1=(duration1/2)*0.0343;
  

  
}


void forword()
{          
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,125);
        analogWrite(speedR,125);                  
       
}
void backword()
{
        
       digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH);
        analogWrite(speedL,125);
        analogWrite(speedR,125);
}

void right()
{      
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, LOW); 
        analogWrite(speedL,125);
        analogWrite(speedR,0);
}
        
void left()
{
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,0);
        analogWrite(speedR,125);
        
}
        
 void stopp()
       {
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,0);
        analogWrite(speedR,0);
       }     
 void smoke ()
 {
   val = digitalRead(flame);
  if (val == LOW) {
    val=0;
  }
  else{
    val=1;
    lcd.println("FIRE");

    }
  }
  
void loop()
{
  
  
  smoke();
   Ultrasonic();
if (distance<20 || distance1<20){
  stopp();delay(500);
  backword();delay (500);
  right();delay(500);

}  
else{forword();}
}
