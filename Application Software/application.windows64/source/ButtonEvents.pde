public void RandomPos(int theValue){
  randomisePlayerPositions();
}
public void RandomStatic(int theValue){
  randomiseStaticPositions();
}
public void RandomDim(int theValue){
  randomiseDimensions();
}
public void ResetEnv(int theValue){
  resetEnvironments();
}
public void StartRound(int theValue){
  if(Trial.trialMode != TRIAL_ACTIVE) {
    println("Error - trial not active");
    return;
  }
  startRound();
  //Trial.trialMode = 1;
  println("Starting Round");
}


public void StartTrialButton(int theValue){
  if(Trial.trialMode != TRIAL_ACTIVE){
     println("Trial activated");
    //Start a new trial  - open the log and write the trial header
    startTrial();
  }else println("Error, Trial already activated");
}

public void StopTrialButton(int theValue){
  if(Trial.trialMode == TRIAL_ACTIVE){
     println("Trial Halted");
    //Stop a trial if it is running  - open the log and write the trial header
    stopTrial();
  }else println("Error, Trial already stopped");
}
public void FreePractice(int theValue){
  Trial.trialMode = 1;
  practiceIterations = 0;
  
  cp5.get(Textlabel.class,"trialStatusLabel").setText("Practice Mode");
  randomisePlayerPositions();
}
public void ManualMode(int theValue){
  Trial.trialMode = 0;
  practiceIterations = 0;
  
  cp5.get(Textlabel.class,"trialStatusLabel").setText("Manual Mode");
}

public void animation(boolean theValue){
  animateRounds = theValue;
  //if(theValue) println("Animation ON");
  //else println("Animation OFF");
}
public void MouseMode(boolean theValue){
  MOUSE_TEST_MODE = theValue;
  //if(theValue) println("Mousemode ON");
  //else println("Mousemode OFF");
}
public void SetEnvParam(int theValue){
  updateTimingData();
}