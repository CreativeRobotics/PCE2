//#include <Haptics.h>
#include <LiquidCrystalFast.h>
#include "Variables.h"
#include "Pins.h"

unsigned long iterations = 0;

LiquidCrystalFast lcd(LCDRS, LCDRW, LCDEN, LCD4, LCD5, LCD6, LCD7);

bool trialActive = 0;
unsigned long updateDisplay = 100;
void setup() {
  analogWriteResolution(10);
  analogWriteFrequency(VIB1PWMPIN, HPWMFreq);
  initPins();
  initSerial();
  initLCD(); //hangs here
  //haptic1.initialise(H1PWMPIN, H1ENABLE);
  //haptic2.initialise(H2PWMPIN, H2ENABLE);

  beepON();
  userLED_ON();
  //USB.println("Started . . .");
  delay(1000);
  
  sendACK();
  userLED_OFF();
	beepOFF();
  startTrackerball();
  //setVib1Strength(0);
}

void loop() {
  //USB.print(iterations);
  //USB.print(' ');
  //printData();
  updateSystem();
  //userLED_ON();
  ///setUserLED(LEDBrightness);
  //LEDBrightness += 16;
  //if(LEDBrightness > 1023) LEDBrightness = 0;
  //setVib1Strength(900);
  //waitFor(100);
  
  //userLED_OFF();
  //setVib1Strength(0);
  //waitFor(100);
  //iterations++;
  
  //lcd.clear();
  //lcd.home();
  //lcd.print(iterations);
}

void updateSystem(){
  if(refreshSerial())packetsReceived++;
  //haptic1.update();
  //haptic2.update();
  buttonState = checkSwitch();
  //updateBeepFlash();
	if(!flashActive) updateButton(); //only update the LED if a flash event is NOT running

  if(!trialActive)updateManual();
}

void updateManual(){
  //update for when not running a trial - copy button commands
  if(buttonState || flashActive) userLED_ON();
  else userLED_OFF();
  if(millis() > updateDisplay){
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print(xCountTotal);
    
    lcd.setCursor(9, 0);
    lcd.print("Button");
    lcd.setCursor(0, 1);
    lcd.print(yCountTotal);
    lcd.setCursor(10, 1);
    
    if(buttonState)  lcd.print("ON");
    else             lcd.print("OFF");
    //if(USB)          lcd.print("USB ON");
    //else             lcd.print("USB OFF");
    updateDisplay = millis()+50;
  }
}
void updateButton(){
	if(buttonState && trialActive) userLED_ON();
  else if(!buttonState && trialActive)  userLED_OFF();
}

void updateBeepFlash(){
  updateBeep();
	updateFlash();
}

void waitFor(unsigned long delayTime){
  elapsedMillis delayTimer;
  while(delayTimer < delayTime) updateSystem();
}

void startTrial(){
  //userLED_ON();
  //beepX(500);
  //userLED_OFF();
  trialActive = 1;
  hapticRate1 = 0;
  hapticRate2 = 0;
  dataSendTimer = 0;
  setHaptics();
  startTrackerball();
  //beep(500);
  printMessage();
}

void stopTrial(){
  //stopTrackerball();
  printMessage();
  hapticRate1 = 0;
  hapticRate2 = 0;
  setHaptics();
  dataSendTimer = 0;
  trialActive = 0;
  //userLED_ON();
  //userLED_ON();
  //beepX(500);
  //userLED_OFF();
  

}


void vibration1On(){
  digitalWrite(VIB1ENABLE, 1);
  digitalWrite(VIB1PWMPIN, 1);
}
void vibration1Off(){
  digitalWrite(VIB1ENABLE, 0);
  digitalWrite(VIB1PWMPIN, 0);
}

void vibration2On(){
  digitalWrite(VIB2ENABLE, 1);
  digitalWrite(VIB2PWMPIN, 1);
}
void vibration2Off(){
  digitalWrite(VIB2ENABLE, 0);
  digitalWrite(VIB2PWMPIN, 0);
}

void setVib1Strength(int intensity){
  if(intensity > 0){
    vibration1On();
    analogWrite(VIB1PWMPIN, intensity);
  }
  else {
    vibration1Off();
    analogWrite(VIB1PWMPIN, 0);
  }
}

void setVib2Strength(int intensity){
  if(intensity > 0){
    vibration2On();
    analogWrite(VIB2PWMPIN, intensity);
  }
  else {
    vibration2Off();
    analogWrite(VIB2PWMPIN, 0);
  }
}
void setHaptics(){
  
  setVib1Strength(hapticRate1);
  setVib2Strength(hapticRate2);
  //haptic1.setLra(hapticRate1);
  //haptic2.setLra(hapticRate2);
}

