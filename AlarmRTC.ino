# Running-Alarm-Robot

#include <virtuabotixRTC.h> //Library used
#include <LiquidCrystal_I2C.h>
#include <Keypad.h>
#include "DHT.h"

LiquidCrystal_I2C lcd(0x27, 16, 2);
virtuabotixRTC myRTC(2, 3, 4); //If you change the wiring change the pins here also

#define pb1 8
#define pb2 9
#define pb3 10


#define sensorPin A0
#define buzzer 5
#define fire 6
int Val = 0;
#define DHTPIN  7
#define DHTTYPE DHT11
DHT dht(DHTPIN,DHTTYPE);
int readSensor;

int x=0;
int y=0;
int z=0;

#define smoke A0



void setup() {
 Serial.begin(9600);
 
 dht.begin();
 lcd.init();
  lcd.backlight();
  lcd.clear();
  
 myRTC.setDS1302Time(myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year); 

 
 pinMode(fire , INPUT);
 pinMode(smoke, INPUT);
 pinMode(buzzer,OUTPUT);
 pinMode(pb1,INPUT);
 pinMode(pb2,INPUT);
 pinMode(pb3,INPUT);


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
  delay(1000);
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
  

void PushB1(){
  
    x++;
    if(x==1)
    {
      Tempr();
    }
    else{
      x=0;
    }
 
}
void PushB2(){
   
 
    if(y==1)
    {
      while(digitalRead(pb3)==HIGH)
{  
  myRTC.hours = ++(myRTC.hours);
      if(myRTC.hours >= 24){
        myRTC.hours=00;
      }
      myRTC.setDS1302Time( myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year);
          Tim();

              
                          delay(250);

}

    }
    else if(y==2) {
      while(digitalRead(pb3)==HIGH)
{  
       myRTC.minutes = ++(myRTC.minutes);
      if(myRTC.minutes >= 60){
        myRTC.minutes=00;
      }
      myRTC.setDS1302Time( myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year);
                Tim();

              
                          delay(250);


}

    }
    else if(y==3) {
      while(digitalRead(pb3)==HIGH)
{  
       myRTC.seconds = ++(myRTC.seconds);
      if(myRTC.seconds >= 60){
        myRTC.minutes=00;
      }
      myRTC.setDS1302Time( myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year);

          Tim();

                    delay(250);


}
}
else if(y==4) {
      while(digitalRead(pb3)==HIGH)
{  
       myRTC.dayofmonth = (++myRTC.dayofmonth);
      if(myRTC.dayofmonth >= 32){
        myRTC.dayofmonth=1;
      }
      myRTC.setDS1302Time( myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year);
          Tim();

                    delay(250);


 }
}
else if(y==5) {
      while(digitalRead(pb3)==HIGH)
{  
       myRTC.month = (++myRTC.month);
      if(myRTC.month >= 13){
        myRTC.month=1;
      }
      myRTC.setDS1302Time( myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year);
          Tim();

                    delay(250);


 }
}
else if(y==6) {
      while(digitalRead(pb3)==HIGH)
{  
       myRTC.year = (++myRTC.year);
      if(myRTC.year >= 2050){
        myRTC.year=2023;
      }
      myRTC.setDS1302Time( myRTC.seconds, myRTC.minutes,  myRTC.hours,  myRTC.dayofweek,  myRTC.dayofmonth, myRTC.month, myRTC.year);
          Tim();

                    delay(250);


 }
}
    else {
            y=0;

    }
   
 
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

  delay(5000);
  
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
 
void loop() {
  
  firee();
  smk();
if(digitalRead(pb1)==HIGH)
{
  PushB1();
}

if(digitalRead(pb2)==HIGH)
{
  
    y++;
    PushB2();
    
}


// Start printing elements as individuals
 
  Tim();

}
