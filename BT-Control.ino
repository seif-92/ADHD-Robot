#include<SoftwareSerial.h>
#define speedL 10
#define IN1 7
#define IN2 6
#define IN3 5
#define IN4 4
#define speedR 10



char reading;

void setup() 
{  
  Serial.begin(9600);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  
  
}

void loop()
{
if (Serial.available()>0){
  reading=Serial.read();



  switch (reading) 
   {
      case 'F' :                                
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,10);
        analogWrite(speedR,10);
        break;

      case 'B' :                 
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH); 
        analogWrite(speedL,10);
        analogWrite(speedR,10);
        
        break;

      case 'R' :         
       digitalWrite(IN1, HIGH);
       digitalWrite(IN2, LOW);
       digitalWrite(IN3, LOW);
       digitalWrite(IN4, HIGH);
        analogWrite(speedL,10);
        analogWrite(speedR,10);
       
        break;
        
      case 'L' :                     
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,10);
        analogWrite(speedR,10);
        break;
        
        case 'S'  :     

        digitalWrite(IN1, LOW);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, LOW);
        break;      

  }

 } 
 
                                                              
  
  
}
