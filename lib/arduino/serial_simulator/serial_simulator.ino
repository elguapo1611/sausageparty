/*   
  adapted from code found here: http://blog.hulihanapplications.com/browse/view/25
  Feed Simulated data via serial(COM) port to computer.  
  This simulated data will be used by a program on the computer to handle serial data from a device.    
*/  
String output, stringTwo, stringThree;

void setup()   
{   
  Serial.begin(9600);   
  Serial.println("Begin Simulated Serial Data Generation!");
  output = String("");  
}   
  
  
  
int interval_time = 1000; // Interval between data being sent. (in ms)  
int min_num = 1; // min value to generate data, must be above 1  
int max_num = 100; // max value to generate  
int sim_data = 0; // initialize data var
int sim_data2 = 0;


void loop()   
{   
  sim_data = random(min_num, max_num);
  sim_data2 = random(min_num, max_num);

  Serial.print(sim_data);
  Serial.print("|");
  Serial.println(sim_data2);
  delay(interval_time); // wait  
}
