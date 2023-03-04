# Running-Alarm-Robot

#define speedL 8
#define IN1 9
#define IN2 10
#define IN3 11
#define IN4 12
#define speedR 13
#define trig 7
#define echo 6
#define trig1 5
#define echo1 4
#define trig2 3
#define echo2 2
long duration,distance,duration1,distance1,duration2,distance2;




void setup() 
{  
  Serial.begin(9600);
  for(int i=7;i<=13;i++)
  {
    pinMode (i,OUTPUT);
  }
     pinMode (5,OUTPUT);
     pinMode (3,OUTPUT);

    pinMode (6,INPUT);
    pinMode (2,INPUT);
    pinMode (4,INPUT);

  
}

void Ultrasonic()
{
  digitalWrite(trig,LOW);

  delayMicroseconds(2);
  
  digitalWrite(trig,HIGH);
  
  delayMicroseconds(10);
  
  digitalWrite(trig,LOW);

  digitalWrite(trig1,LOW);

  delayMicroseconds(2);
  
  digitalWrite(trig1,HIGH);
  
  delayMicroseconds(10);
  
  digitalWrite(trig1,LOW);

 digitalWrite(trig2,LOW);

  delayMicroseconds(2);
  
  digitalWrite(trig2,HIGH);
  
  delayMicroseconds(10);
  
  digitalWrite(trig2,LOW);

  duration=pulseIn(echo,HIGH);
  distance=(duration/2)*0.0343;

  
  duration1=pulseIn(echo1,HIGH);
  distance1=(duration1/2)*0.0343;

  
  duration2=pulseIn(echo2,HIGH);
  distance2=(duration2/2)*0.0343;


  
}



void forword()
{          
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
        analogWrite(speedL,200);
        analogWrite(speedR,200);                  
       
}
void backword()
{
        
       digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH);
         analogWrite(speedL,200);
        analogWrite(speedR,200);  
}

void right()
{      
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        digitalWrite(IN3, LOW);
        digitalWrite(IN4, HIGH); 
         analogWrite(speedL,200);
        analogWrite(speedR,200);  
}
        
void left()
{
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        digitalWrite(IN3, HIGH);
        digitalWrite(IN4, LOW);
         analogWrite(speedL,200);
        analogWrite(speedR,200);  
        
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
void loop()
{
   Ultrasonic();
if ((distance<15) || (distance1<15) || (distance2<15)){
  stopp();delay(1000);
  backword();delay (1000);
  right();delay(1000);

}  
else{forword();}
}
