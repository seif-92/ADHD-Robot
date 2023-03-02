# Running-Alarm-Robot
#include <virtuabotixRTC.h> //Library used
#include <LiquidCrystal_I2C.h>
#include <Keypad.h>
#include "DHT.h"

LiquidCrystal_I2C lcd(0x27, 16, 2);
virtuabotixRTC myRTC(2, 3, 4); //If you change the wiring change the pins here also

#define sensorPin A0
#define buzzer 5
#define fire 6
int Val = 0;
#define DHTPIN  7
#define DHTTYPE DHT11
DHT dht(DHTPIN,DHTTYPE);
int readSensor;


void setup() {
 Serial.begin(9600);
 
 dht.begin();
 lcd.init();
  lcd.backlight();
  lcd.clear();
  
 myRTC.setDS1302Time(15, 22, 2, 7, 4, 3, 2023); 
 
 pinMode(fire , INPUT);
 pinMode(buzzer,OUTPUT);

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
  }
  
}


 

 
void loop() {
  readSensor=analogRead(sensorPin);
  Serial.println(readSensor);

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
  delay(2000);

// Start printing elements as individuals
 for (int i=0;i<3;i++){
  myRTC.updateTime();
    firee();
 
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
 delay(1000);
 }




}
