import 'dart:html';
import 'dart:async';

DivElement title;
ParagraphElement header;
DivElement underleft;
DivElement underright;

DivElement block1;
DivElement block1interior;
ButtonElement splayerbutton;
ButtonElement mplayerbutton;
DivElement directiveouter;
ParagraphElement directive;

DivElement splayerinterior;
DivElement mplayerinterior;

DivElement settingsdiv;
ButtonElement settings;
ParagraphElement settingsp;

var fadeDuration = new Duration(milliseconds: 200);
var spinDuration = new Duration(milliseconds: 1000);
var menuDuration = new Duration(milliseconds: 500);
int choice = 0;
bool settingsopen = false;

void main() {
  
  // Connects game title elements to their HTML instances
  title = querySelector('#title');
  header = querySelector('#header');
  underleft = querySelector('#underleft');
  underright = querySelector('#underright');
  
  // Connects first block elements to their HTML instances
  block1 = querySelector('#block1');
  block1interior = querySelector('#block1interior');
  splayerbutton = querySelector('#splayerbutton');
  mplayerbutton = querySelector('#mplayerbutton');
  directiveouter = querySelector('#directiveouter');
  directive = querySelector('#directive');
  
  splayerinterior = querySelector('#splayerinterior');
  mplayerinterior = querySelector('#mplayerinterior');
  
  settingsdiv = querySelector('#settingsdiv');
  settings = querySelector('#settings');
  settingsp = querySelector('#settingsp');
  
  // Starts the program
  start();
  
}

void start(){
  
  splayerinterior.remove();
  mplayerinterior.remove();
  
  //If a button is clicked, calls upon method with appropriate parameters
  splayerbutton.onClick.listen((e) => buttonClicked(splayerbutton, mplayerbutton, directiveouter));
  mplayerbutton.onClick.listen((e) => buttonClicked(mplayerbutton, splayerbutton, directiveouter));
  
  //If the settings icon is clicked, calls upon appropriate method
  settings.onClick.listen((e) => settingsClicked());
  
}

//----------------------------------------------//
//----------------------------------------------//
//----------------------------------------------//
//----------GAME BUTTON METHODS BELOW-----------//
//----------------------------------------------//
//----------------------------------------------//
//----------------------------------------------//

void buttonClicked(ButtonElement x, ButtonElement y, DivElement z){
  
  // Styling changes to confirm choice
  block1interior.style.opacity = "0";
  block1.style.boxShadow = "inset 0px 0px 20px 2.5px #26A65B";
  
  // Logging player's choice
  if(x == splayerbutton){
    choice = 1;
  }else if(x == mplayerbutton){
    choice = 2;
  }
  
  new Timer(fadeDuration, firstFade);
  
}

void firstFade(){
  
  if(choice == 1){
    block1interior.replaceWith(splayerinterior);
  }else if(choice == 2){
    block1interior.replaceWith(mplayerinterior);
  }
  
  new Timer(fadeDuration, secondFade);
  
}

void secondFade(){
  if(choice == 1){
      splayerinterior.style.opacity = "1";
    }else if(choice == 2){
      mplayerinterior.style.opacity = "1";
    }
}

//----------------------------------------------//
//----------------------------------------------//
//----------------------------------------------//
//------------SETTINGS METHODS BELOW------------//
//----------------------------------------------//
//----------------------------------------------//
//----------------------------------------------//

void settingsClicked(){
  
  //Checks if settings menu is open or closed. 
  if(settingsopen == false){
    //Twists the settings cog
    settings.classes.add('twist');
    settings.classes.add('spinleft');
    
    //Opens the settings menu
    settingsdiv.style.width = '700px';
    settingsdiv.style.height = '350px';
    
    //Wait 1 second to call the openSettings method
    new Timer(menuDuration, openSettings);
  }else{
    //Twists the settings cog
    settings.classes.add('twist');
    settings.classes.add('spinright');
    
    //Close the settings menu
    settingsdiv.style.width = '64px';
    settingsdiv.style.height = '64px';
    settingsp.style.transitionDuration='.25s';
    settingsp.style.opacity= '0';
    
    //Wait 1 second to call the closeSettings method
    new Timer(spinDuration, closeSettings);
  }
}

void openSettings(){
  settingsp.style.transitionDuration='.5s';
  settingsp.style.opacity= '1';
  settingsopen = true;
  
  new Timer(menuDuration, removeSettingsAnimations);
}

void closeSettings(){
  settingsopen = false;
  removeSettingsAnimations();
}

void removeSettingsAnimations(){
  settings.classes.remove('twist');
  settings.classes.remove('spinleft');
  settings.classes.remove('spinright');
}
