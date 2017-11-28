int buttonFontSize = 14;



int setupAnimationButton(int xp, int yp, int gap){
  int xps = xp;
  int yps = yp;
  cp5.addToggle("animation")
   .setBroadcast(false)
   .setPosition(xps, yps)
   .setSize(100,30)
   .setValue(true)
   .setMode(ControlP5.DEFAULT)
   .setFont(createFont("Arial",buttonFontSize))
   .setColorLabel(0)
   .setLabel("Toggle Animation") 
   .setLabelVisible(true)  
   .setBroadcast(true)
   ;
    return yps+gap;
}

int setupMouseConButton(int xp, int yp, int gap){
  int xps = xp;
  int yps = yp;
  cp5.addToggle("MouseMode")
   .setBroadcast(false)
   .setPosition(xps, yps)
   .setSize(100,30)
   .setValue(false)
   .setMode(ControlP5.DEFAULT)
   .setFont(createFont("Arial",buttonFontSize))
   .setColorLabel(0)
   .setLabel("Enable Mouse") 
   .setLabelVisible(true)  
   .setBroadcast(true)
   ;
    return yps+gap;
}


int setupRandomButtons(int xp, int yp, int bWidth,int gap){
  int xps = xp;
  int yps = yp;
  cp5.addButton("RandomPos")
   .setBroadcast(false)
   .setPosition(xps, yps)
   .setSize(bWidth,30)
   .setFont(createFont("Arial",buttonFontSize))
   .setColorLabel(255)
   .setLabel("Randomise User Positions") 
   .setLabelVisible(true)  
   .setBroadcast(true)
   ;
   yps+=gap;
  cp5.addButton("RandomStatic")
   .setBroadcast(false)
   .setPosition(xps, yps)
   .setSize(bWidth,30)
   .setFont(createFont("Arial",buttonFontSize))
   .setColorLabel(255)
   .setLabel("Randomise Static Object Position") 
   .setLabelVisible(true)  
   .setBroadcast(true)
   ;
   yps+=gap;
   cp5.addButton("RandomDim")
   .setBroadcast(false)
   .setPosition(xps, yps)
   .setSize(bWidth,30)
   .setFont(createFont("Arial",buttonFontSize))
   .setColorLabel(255)
   .setLabel("Randomise Sizes") 
   .setLabelVisible(true)  
   .setBroadcast(true)
   ;
   yps+=gap;
   cp5.addButton("ResetEnv")
   .setBroadcast(false)
   .setPosition(xps, yps)
   .setSize(bWidth,30)
   .setFont(createFont("Arial",buttonFontSize))
   .setColorLabel(255)
   .setLabel("Reset") 
   .setLabelVisible(true)  
   .setBroadcast(true)
   ;
    return yps+gap;
}
/*
void LED2(boolean theFlag){
  if(theFlag == true) sendLedOn(2);
  else                sendLedOff(2);
}
void Beep2(boolean theFlag){
  if(theFlag == true) sendBeepOn(2);
  else                sendBeepOff(2);
}*/

void setupLog(){
  int cCentre = width/2;
  int bWidth = 100;
  
  /*cp5.addToggle("LogDataButton")
     .setBroadcast(false)
     .setPosition(cCentre-(bWidth/2), startAY)
     .setSize(bWidth,30)
     .setValue(false)
     .setMode(ControlP5.DEFAULT)
     .setLabel("Start Log") 
     .setLabelVisible(true)  
     .setBroadcast(true)
     ;*/
     
}


void setupCommandButtons(){
  int buttonW = 300;
  int buttonH = 50;
  int vPos = 35;
  int vSpace = buttonH+5;
  int centreStart = (width/2)-(buttonW/2);
  
  int fSize = 15;
     

  cp5.addButton("ManualMode")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(centreStart, vPos)
     .setSize(buttonW, buttonH)  
     .setBroadcast(true)
     .setCaptionLabel("Manual Mode")
     .getCaptionLabel()
     .setFont(largeFont)
     .toUpperCase(false)
     .setSize(fSize)
     ;
   vPos += vSpace;
  cp5.addButton("FreePractice")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(centreStart, vPos)
     .setSize(buttonW, buttonH)  
     .setBroadcast(true)
     .setCaptionLabel("Free Practice Mode")
     .getCaptionLabel()
     .setFont(largeFont)
     .toUpperCase(false)
     .setSize(fSize)
     ;
     
     vPos += vSpace+20;
  cp5.addButton("StartTrialButton")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(centreStart, vPos)
     .setSize(buttonW, buttonH)  
     .setBroadcast(true)
     .setCaptionLabel("Start Trial")
     .getCaptionLabel()
     .setFont(largeFont)
     .toUpperCase(false)
     .setSize(fSize)
     ;
   vPos += vSpace;
  cp5.addButton("StopTrialButton")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(centreStart, vPos)
     .setSize(buttonW, buttonH)  
     .setBroadcast(true)
     .setCaptionLabel("Stop Trial")
     .getCaptionLabel()
     .setFont(largeFont)
     .toUpperCase(false)
     .setSize(fSize)
     ;
   cp5.addTextlabel("TrialLabel")
      .setText(String.valueOf(Trial.trialNumber))
      .setPosition(centreStart+ buttonW + 10, vPos+5)
      .setColorValue(0)
      .setFont(createFont("Arial",buttonFontSize*2))
      ;
      
      
      
   vPos += vSpace+20;
  cp5.addButton("StartRound")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(centreStart, vPos)
     .setSize(buttonW, buttonH)  
     .setBroadcast(true)
     .setCaptionLabel("Start Round")
     .getCaptionLabel()
     .setFont(largeFont)
     .toUpperCase(false)
     .setSize(fSize)
     ;
   cp5.addTextlabel("RoundLabel")
      .setText(String.valueOf(Trial.roundNumber))
      .setPosition(centreStart+ buttonW + 10, vPos+5)
      .setColorValue(0)
      .setFont(createFont("Arial",buttonFontSize*2))
      ;
   
   
   vPos += vSpace; 
   cp5.addTextlabel("trialStatusLabel")
      .setText("Practice Mode")
      .setPosition(centreStart, vPos+5)
      .setColorValue(0)
      .setFont(createFont("Arial",buttonFontSize*2))
      ;  
   vPos += vSpace; 
   cp5.addTextlabel("roundStatusLabel")
      .setText("Round finished")
      .setPosition(centreStart, vPos+5)
      .setColorValue(0)
      .setFont(createFont("Arial",buttonFontSize*2))
      ;  
      
 /* vPos += vSpace;
  cp5.addButton("PracticeSession")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(centreStart, vPos)
     .setSize(buttonW, buttonH)  
     .setBroadcast(true)
     .getCaptionLabel()
     .setFont(largeFont)
     .toUpperCase(false)
     .setSize(fSize-2)
     ;*/
}