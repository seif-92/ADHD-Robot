#include <virtuabotixRTC.h> //Library used
#include <LiquidCrystal_I2C.h>
#include <Keypad.h>
#include "DHT.h"

LiquidCrystal_I2C lcd(0x27, 16, 2);
virtuabotixRTC myRTC(9, 10, 11); //If you change the wiring change the pins here also

#include<SoftwareSerial.h>

#define sensorPin A0
#define smoke A0

#define speedL 6
#define IN1 8
#define IN2 7
#define IN3 4
#define IN4 2
#define speedR 5
#define trig 13
#define echo 12
#define fire 3
#define buzzer A3
#define DHTPIN  A1
#define DHTTYPE DHT11
DHT dht(DHTPIN,DHTTYPE);
int readSensor;

#define pb A2
int x=0;


int Val = 0;

long duration,distance;



void setup() 
{  
  Serial.begin(9600);

  lcd.backlight();
  lcd.init();
  lcd.clear();

 myRTC.setDS1302Time(00, 22, 3, 3, 13, 5, 2023); 

    pinMode (6,OUTPUT);
    pinMode (9,OUTPUT);
    pinMode (10,INPUT);
    pinMode (11,OUTPUT);
    pinMode (8,OUTPUT);
    pinMode (7,OUTPUT);
    pinMode (4,OUTPUT);
    pinMode (2,OUTPUT);
    pinMode (5,OUTPUT);
    pinMode (13,OUTPUT);
    pinMode(A3,OUTPUT);

    pinMode(pb, INPUT);
    pinMode(smoke, INPUT);
    pinMode (12,INPUT);
    pinMode(3 , INPUT);

  
}

void Ultrasonic()
{
  digitalWrite(trig,LOW);
  delayMicroseconds(2);
  digitalWrite(trig,HIGH);
  delayMicroseconds(10);
  digitalWrite(trig,LOW);
  duration=pulseIn(echo,HIGH);
  distance=(duration/2)*0.0343;
}

void forword()
{          
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,400);
        analogWrite(speedR,400);                  
       
}
void backword()
{
        
       digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH);
        analogWrite(speedL,400);
        analogWrite(speedR,400);
}

void right()
{      
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH); 
        analogWrite(speedL,400);
        analogWrite(speedR,400);
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

 void obstacle ()
 {
  {
 digitalWrite(buzzer, HIGH);
 Ultrasonic();
 if (distance<20 ){
  
 stopp();delay(1000);
 backword();delay (1000);
 right();delay(1000);

}  
else{forword();}
}
  myRTC.updateTime();

 }


void firee (){
  
  Val = digitalRead(fire);  
  if (Val == LOW ) { 
  digitalWrite(buzzer, LOW);
  Val=0;
  }
  else {
  digitalWrite(buzzer, HIGH);
 
  lcd.clear();
  lcd.setCursor(0,0); 
  lcd.print(" FIRE#FIRE#FIRE ");
  lcd.setCursor(0,1); 
  lcd.print(" FIRE#FIRE#FIRE ");
  delay(500);
  lcd.clear();
  
  }
  
}
void smk (){
int analogSensor = analogRead(smoke);
Serial.println(analogSensor);
  if (analogSensor< 450 ) { 
  digitalWrite(buzzer, LOW);
  }
  else {
  digitalWrite(buzzer, HIGH);
 
  lcd.clear();
  lcd.setCursor(0,0); 
  lcd.print(" GAS#DETECTED#ER ");
  lcd.setCursor(0,1); 
  lcd.print(" GAS#DETECTED#ER ");
  delay(1000);
  lcd.clear();
  }
  
}
void Tim(){
  myRTC.updateTime();
  firee();
  smk();
  
 lcd.setCursor(0,0);
 lcd.print("Date : ");
 lcd.print(myRTC.dayofmonth); //You can switch between day and month if you're using American system
 lcd.print("/");
 lcd.print(myRTC.month);
 lcd.print("/");
 lcd.print(myRTC.year);
 lcd.setCursor(0,1);

 lcd.print("TIME : ");
 lcd.print(myRTC.hours);
 lcd.print(":");
 lcd.print(myRTC.minutes);
 lcd.print(":");
 lcd.print(myRTC.seconds);
  lcd.print(" ");

 }
 
void Tempr(){
   lcd.clear();
  lcd.setCursor(0,0); 
  lcd.print("Temp : ");
  lcd.print(dht.readTemperature());
  lcd.print((char)223);
  lcd.print("C");
  lcd.setCursor(0,1); 
  lcd.print("Humd : ");
  lcd.print(dht.readHumidity());
    lcd.print(" %");
    firee();
      smk();

  delay(1000);
     lcd.clear();

}

void PushB(){
        x++;

    if(x==1)
    {
      obstacle();
    }
    else{
      x=0;
      Tim();

    }
 
}
void loop()

{

Tim();
if(digitalRead(pb)==HIGH)
{
Tempr();    
}
if((myRTC.hours==3 )&& (myRTC.minutes==22)&& (myRTC.seconds==22))
{
  do{
    obstacle();
  }
  while (digitalRead(pb)==LOW);
  stopp();
  
 }
}



