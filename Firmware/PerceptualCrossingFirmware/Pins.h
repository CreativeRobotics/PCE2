//perceptual crossing firmware
//pin definitions
#define VERSION_2
/*
 * Version 1 was produced for Mexico University
 * Version 2 was produced for University of Lueven
 */

#ifdef VERSION_2

  #define VIB1ENABLE 13
  #define VIB1PWMPIN 3
  
  #define VIB2ENABLE 2
  #define VIB2PWMPIN 4
  
  #define HPWMFreq 35156.25
  
  #define TRACKERBALL_XA 22
  #define TRACKERBALL_XB 23
  #define TRACKERBALL_YA 8
  #define TRACKERBALL_YB 7
  
  #define USER_SWITCH_PIN 11
  #define USER_LED_PIN    20
  #define SOUNDER_PIN     6
  
  
  #define LCD4 16
  #define LCD5 17
  #define LCD6 18
  #define LCD7 19
  
  
  #define LCDRS 12
  #define LCDEN 14
  #define LCDRW 15

#endif

#ifdef VERSION_1

  #define VIB1ENABLE 1
  #define VIB1PWMPIN 3
  
  #define VIB2ENABLE 2
  #define VIB2PWMPIN 4
  
  #define HPWMFreq 35156.25
  
  #define TRACKERBALL_XA 22
  #define TRACKERBALL_XB 23
  #define TRACKERBALL_YA 20
  #define TRACKERBALL_YB 21
  
  #define USER_SWITCH_PIN 7
  #define USER_LED_PIN    5
  #define SOUNDER_PIN     6
  
  
  #define LCD4 16
  #define LCD5 17
  #define LCD6 18
  #define LCD7 19
  
  
  #define LCDRS 12
  #define LCDEN 14
  #define LCDRW 15

#endif


