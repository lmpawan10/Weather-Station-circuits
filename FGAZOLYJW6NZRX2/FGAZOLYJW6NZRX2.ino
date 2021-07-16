uss //PREPROCESSOR FOR SDCARD MODULE
//#include <SD.h>
#include <SPI.h>
#include "SdFat.h"
SdFat SD;
File myFile;
byte pinCS = 53;
String fileName;

//PREPROCESSOR FOR LCD
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // run ic2_scanner sketch and get the IC2 address, which is 0x3f in my case,it could be 0x3f in many

//PREPROCESSOR FOR DS3231         RTC
// Init the DS3231 using the hardware interface
#include <DS3231.h>
DS3231  rtc(SDA, SCL);

//preprocessor for bmp180 sensor
#include <SFE_BMP180.h>
#include <Wire.h>

SFE_BMP180 pressure;
#define ALTITUDE 41

//preprocessor for bh1750 sensor
#include <BH1750.h>
BH1750 lightMeter(0x23);

//preprocessor for dht22 sensor
#include <DHT.h>
#define DHTPIN 2
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

//preprocessor for wind sensor
#define analogPinForRV    1   // change to pins you the analog pins are using
#define analogPinForTMP   0

const float zeroWindAdjustment =  .2; // negative numbers yield smaller wind speeds and vice versa.

int TMP_Therm_ADunits;  //temp termistor value from wind sensor
float RV_Wind_ADunits;    //RV output from wind sensor
float RV_Wind_Volts;
unsigned long lastMillis;
int TempCtimes100;
float zeroWind_ADunits;
float zeroWind_volts;
float WindSpeed_MPH;


//Delay Array
long D[] = {0000, 1000, 2000, 3000};

//Global Variables

//bmp name-value arrays
String bmpName[] = {"Altitude(M)", "Outdoor Temp (C)", "Absolute Pressure (mmHg)", "Relative Sea Pressure (mmHg)", "Computed Altitude (M)"};
float bmpValue[5];
const int bmpLength = sizeof(bmpName) / sizeof(bmpName[0]);
//multiple data
float bmpMultiValue[42][bmpLength];

//\xC2\xB0

//bh1750 name-value arrays
String bh1750Name[] = {"Irradiance (W/m2)", "Light Intensity (Lux)"};
float bh1750Value[2];
const int bh1750Length = sizeof(bh1750Name) / sizeof(bh1750Name[0]);
//multiple data
float bh1750MultiValue[42][bh1750Length];

//dht name-value arrays
String dhtName[] = { "Humidity (%)", "Indoor Temp (C)", "HeatIndex (C)" };
float dhtValue[5];
const int dhtLength = sizeof(dhtName) / sizeof(dhtName[0]);
//multiple data
float dhtMultiValue[42][dhtLength];

//rtc name-value arrays
String rtcName[] = { "Day", "Date", "Time", "Indoor Temp (C)"};
String rtcValue[4];
const int rtcLength = sizeof(rtcName) / sizeof(rtcName[0]);
//multiple data
String rtcMultiValue[42][rtcLength];

//wind sensor name-value arrays
String windName[] = {"Wind Speed (MPH)"};
float windValue[1];
const int windLength = sizeof(windName) / sizeof(windName[0]);
//multiple data
float windMultiValue[42][windLength];

//Array for data to be store onboard if sdcard is not available
const int allDataLength = bmpLength + bh1750Length + dhtLength + rtcLength + windLength;
float onBoardData[10][allDataLength];


//start up check value
bool startUp;
//outdoor module value
bool outdoorModule = true;
//value for write to sd card cycle
int sdWriteCycle = 0;
//store day of the week value on start value
String Today;
//loop cycle
int noSdCycle = 0;


void setup() {
  Serial.begin(9600);



  //Assigns a value to start time

  startUp = true;
  lcdSetup();
  rtcSetup();

  bmp180SetUp();
  bh1750SetUp();
  dht22Setup();
}



void loop() {

  if (outdoorModule == false) {
    lcd.clear();
    printer("Outdoor module not detected", "Check connection");
    delay(2000);
    lcd.clear();
  }

  bmp180Loop();
  bh1750Loop();
  windLoop();
  dht22Loop();
  rtcLoop();
  printToLcd();
  if (startUp == true) {
    sdCardSetup();
  }

  if (sdWriteCycle == 0 || sdWriteCycle == 7) {
    printer("Record cycle Started");
    if (!SD.open(fileName)) {
      printer("There is no sdcard yet");
      storeOnBoard();
    }
    else {
      printer("There is sdcard");
      if (noSdCycle > 0) {
        printer("file available on board store");
        if (startUp) {
          printer("sd was not init b4");
          if (!SD.open(fileName)) {

            sdCardSetup();
          } else {
            printer("Print data names");
            printDataNames();
          }
        }
        writeFromBoard();
        noSdCycle = 0;
        sdWriteCycle = 0;
      }
      else {
        writeSensorValues();
        sdWriteCycle = 0;
      }
    }
  }
  sdWriteCycle++;
  startUp = false;



  //Assigns a value to current time
  //subtract start time from current time

  //check if the start and current time are greater than a specified time

  //if true write to sdcard
  //assign current time to start time


}

//Print To lcd
void printToLcd() {

  lcd.clear();
  //print date and time
  printer("Date: " + rtcValue[0] + " (" + rtcValue[1] + ")", "Time: " + rtcValue[2]);
  delay(2000);

  for (int i = 0; i < dhtLength; i++) {
    lcd.clear();
    printer(String(dhtName[i]), String(dhtValue[i]));
    delay(2000);
  }

  if (outdoorModule == true) {

    for (int i = 0; i < bmpLength; i++) {
      lcd.clear();
      printer(String(bmpName[i]), String(bmpValue[i]));
      delay(2000);
    }

    for (int i = 0; i < bh1750Length; i++) {
      lcd.clear();
      printer(String(bh1750Name[i]), String(bh1750Value[i]));
      delay(2000);
    }

    for (int i = 0; i < windLength; i++) {
      lcd.clear();
      printer(String(windName[i]), String(windValue[i]));
      delay(2000);
    }

  }
  lcd.clear();
}


//SETUP FOR SDCARD MODULE
void sdCardSetup() {

  if (Today != rtc.getDOWStr()) {

    Today = rtc.getDOWStr();

    pinMode(pinCS, OUTPUT);

    if (SD.begin(pinCS))
    {
      printer("SD card initialized");
      lcd.clear();
      delay(2000);



      String tempName = String(rtc.getDOWStr()) + " " + String(rtc.getDateStr()) + "_" + String(rtc.getTimeStr()) + ".csv";
      tempName.replace(":", "-");
      String Name = tempName;
      fileName = tempName;

      byte fileNum = 0;
      while (SD.open(fileName)) {
        fileNum++;
        fileName = "(" + String(fileNum) + ") " + Name;
        printer(fileName);
      }




      //myFile.println("Day, Date, Time, Temp dht, Temp bmp, Temp rtc, Humidity, Light, absolute prssure mb, relative sea pressure mb, Defined altitude, computed altitude");
      printDataNames();


      printer(fileName + " Created");
      lcd.clear();
    } else {
      printer(F("SD card initialization failed"));
      delay(D[2]);
      lcd.clear();
    }

  }

}

void lcdSetup() {
  lcd.begin();

  String logo = "<AbiolaSoft />";
  printer(logo, "F/HD/16/3430038");
  delay(1000);


  // scroll 13 positions (string length) to the left
  // to move it offscreen left:
  for (int positionCounter = 0; positionCounter < 16 - logo.length(); positionCounter++) {
    // scroll one position left:
    lcd.scrollDisplayRight();
    // wait a bit:
    delay(150);
  }

  // scroll 29 positions (string length + display length) to the right
  // to move it offscreen right:
  for (int positionCounter = 0; positionCounter < 16 - logo.length(); positionCounter++) {
    // scroll one position right:
    lcd.scrollDisplayLeft();
    // wait a bit:
    delay(150);
  }
  delay(2000);
  lcd.clear();
}

//RTC SETUP
void rtcSetup()
{
  // Initialize the rtc object
  rtc.begin();

  // The following lines can be uncommented to set the date and time
  //rtc.setDOW(THURSDAY);     // Set Day-of-Week to SUNDAY
  //rtc.setTime(1, 43, 0);     // Set the time to 12:00:00 (24hr format)
  //rtc.setDate(7, 6, 2018);   // Set the date to January 1st, 2014
}
//BMP180 SETUP
void bmp180SetUp() {

  printer(F("BMP180 OK!"));
  if (pressure.begin()) {
    lcd.clear();
  } else
  {
    //printer(F("BMP180 init fail\n\n"));
    outdoorModule = false;
  }

}

//BH1750 SETUP
void bh1750SetUp() {
  Wire.begin();

  if (lightMeter.begin(BH1750::CONTINUOUS_HIGH_RES_MODE)) {
    printer(F("BH1750 OK!"));
    lcd.clear();
  }
  else {
    //printer(F("Error initialising BH1750"));
    outdoorModule = false;
  }

}

//DHT22 SETUP
void dht22Setup() {
  printer(F("DHT22 OK!"));
  lcd.clear();
  dht.begin();
}


//BMP180 LOOP
void bmp180Loop() {

  char status;
  double T, P, p0, a;
  float defAltM, defAltF, tempC, tempF, absPreMb, absPreInHg, relSeaPreinHg, relSeaPremmHg, absPremmHg, relSeaPremb, compAltM, compAltF;

  //predefine alt in meters
  defAltM = ALTITUDE;
  //predef alt in feet
  defAltF =  ALTITUDE * 3.28084;
  ;

  status = pressure.startTemperature();
  if (status != 0)
  {
    delay(status);

    status = pressure.getTemperature(T);
    if (status != 0)
    {
      //temperature in celcius
      tempC = T;
      //temperature in fah
      tempF = (9.0 / 5.0) * T + 32.0;


      status = pressure.startPressure(3);
      if (status != 0)
      {

        delay(status);

        status = pressure.getPressure(P, T);
        if (status != 0)
        {
          //absolute pressure in mb
          absPreMb = P;
          //absolute pressure in inHg
          absPreInHg = P * 0.0295333727;
          //absolute pressure in mmHg
          absPremmHg = absPreInHg / 25.4;


          p0 = pressure.sealevel(P, ALTITUDE);

          //relative pressure sealevel
          relSeaPremb = p0;
          // relative sea pressure inHg
          relSeaPreinHg = p0 * 0.0295333727, 2;
          // relative sea pressure inHg
          relSeaPremmHg = relSeaPreinHg / 25.4;


          a = pressure.altitude(P, p0);
          //computed altitude
          compAltM = a;
          //compute altitude in feet
          compAltF = a * 3.28084;

        }
        else myFile.println(F("error retrieving pressure measurement\n"));
      }
      else myFile.println(F("error starting pressure measurement\n"));
    }
    else myFile.println(F("error retrieving temperature measurement\n"));
  }
  else myFile.println(F("error starting temperature measurement\n"));


  bmpValue[0] = defAltM;
  bmpValue[1] = tempC;
  bmpValue[2] = absPremmHg;
  bmpValue[3] = relSeaPremmHg;
  bmpValue[4] = compAltM;

  delay(0);

}

//BH1750 LOOP
void bh1750Loop() {

  uint16_t lux = lightMeter.readLightLevel();
  uint16_t wattPerM2 = lux * 0.0079;

  //assign lux value to array
  bh1750Value[0] = wattPerM2;
  bh1750Value[1] = lux;

}


//DHT22 LOOP
void dht22Loop() {
  delay(0);

  float h = dht.readHumidity();
  //temperature C.
  float t = dht.readTemperature();
  //temperature F.
  float f = dht.readTemperature(true);

  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println(F("Failed to read from DHT sensor!"));
    return;
  }

  //fahrenheit
  float hif = dht.computeHeatIndex(f, h);
  //celcius
  float hic = dht.computeHeatIndex(t, h, false);

  dhtValue[0] = h;
  dhtValue[1] = t;
  dhtValue[2] = hic;


}


//RTC LOOP
void rtcLoop()
{

  rtcValue[0] = rtc.getDOWStr();
  rtcValue[1] = rtc.getDateStr();
  rtcValue[2] = rtc.getTimeStr();
  rtcValue[3] = rtc.getTemp();

}

void windLoop() {

  if (millis() - lastMillis > 200) {     // read every 200 ms - printing slows this down further

    TMP_Therm_ADunits = analogRead(analogPinForTMP);
    RV_Wind_ADunits = analogRead(analogPinForRV);
    RV_Wind_Volts = (RV_Wind_ADunits *  0.0048828125);

    // these are all derived from regressions from raw data as such they depend on a lot of experimental factors
    // such as accuracy of temp sensors, and voltage at the actual wind sensor, (wire losses) which were unaccouted for.
    TempCtimes100 = (0.005 * ((float)TMP_Therm_ADunits * (float)TMP_Therm_ADunits)) - (16.862 * (float)TMP_Therm_ADunits) + 9075.4;

    zeroWind_ADunits = -0.0006 * ((float)TMP_Therm_ADunits * (float)TMP_Therm_ADunits) + 1.0727 * (float)TMP_Therm_ADunits + 47.172; //  13.0C  553  482.39

    zeroWind_volts = (zeroWind_ADunits * 0.0048828125) - zeroWindAdjustment;

    // This from a regression from data in the form of
    // Vraw = V0 + b * WindSpeed ^ c
    // V0 is zero wind at a particular temperature
    // The constants b and c were determined by some Excel wrangling with the solver.

    WindSpeed_MPH =  pow(((RV_Wind_Volts - zeroWind_volts) / .2300) , 2.7265);

    Serial.print("  TMP volts ");
    Serial.print(TMP_Therm_ADunits * 0.0048828125);

    Serial.print(" RV volts ");
    Serial.print((float)RV_Wind_Volts);

    Serial.print("\t  TempC*100 ");
    Serial.print(TempCtimes100 );

    Serial.print("   ZeroWind volts ");
    Serial.print(zeroWind_volts);

    Serial.print("   WindSpeed MPH ");
    Serial.println((float)WindSpeed_MPH);
    lastMillis = millis();



    windValue[0] = WindSpeed_MPH;
    lastMillis = millis();
  }

}


void printDataNames() {

  myFile = SD.open(fileName, FILE_WRITE);

  //print rtc header
  for (int i = 0; i < rtcLength; i++) {
    myFile.print(rtcName[i] + ",");
  }

  //print dht22 header
  for (int i = 0; i < dhtLength; i++) {
    myFile.print(dhtName[i] + ",");
  }

  if (outdoorModule == true) {
    //print bmp180 header
    for (int i = 0; i < bmpLength; i++) {
      myFile.print(bmpName[i] + ",");
    }

    //print bh1750 header
    for (int i = 0; i < bh1750Length; i++) {
      myFile.print(bh1750Name[i] + ",");
    }

    //print wind sensor header
    for (int i = 0; i < windLength; i++) {
      myFile.print(windName[i] + ",");
    }
  }

  myFile.close();
}

void writeSensorValues() {
  lcd.clear();
  printer("Writing to SD card");


  myFile = SD.open(fileName, FILE_WRITE);
  myFile.println(" ");

  //print rtc values
  for (int i = 0; i < rtcLength; i++) {
    myFile.print(String(rtcValue[i]) + ",");
  }

  //print dht22 values
  for (int i = 0; i < dhtLength; i++) {
    myFile.print(String(dhtValue[i]) + ",");
  }

  if (outdoorModule == true) {

    //print bmp180 values
    for (int i = 0; i < bmpLength; i++) {
      myFile.print(String(bmpValue[i]) + ",");
    }

    //print bh1750 values
    for (int i = 0; i < bh1750Length; i++) {
      myFile.print(String(bh1750Value[i]) + ",");
    }

    //print wind sensor values
    for (int i = 0; i < windLength; i++) {
      myFile.print(String(windValue[i]) + ",");
    }

  }

  myFile.close();
  delay(1000);
  lcd.clear();

}

void storeOnBoard() {
  noSdCycle++;
  //store data to mulitdimenstional arrays
  for (int i = 0; i < rtcLength; i++) {
    rtcMultiValue[noSdCycle][i] = rtcValue[i];
  }

  for (int i = 0; i < dhtLength; i++) {
    dhtMultiValue[noSdCycle][i] = dhtValue[i];
  }


  if (outdoorModule == true) {
    for (int i = 0; i < bmpLength; i++) {
      bmpMultiValue[noSdCycle][i] = bmpValue[i];
    }

    for (int i = 0; i < bh1750Length; i++) {
      bh1750MultiValue[noSdCycle][i] = bh1750Value[i];
    }

    for (int i = 0; i < windLength; i++) {
      windMultiValue[noSdCycle][i] = windValue[i];
    }
  }

}



void writeFromBoard() {

  lcd.clear();
  printer("Writing Bulk data to SD card");


  myFile = SD.open(fileName, FILE_WRITE);
  myFile.println(" ");

  for (int j = 0; j < noSdCycle; j++) {

    //print rtc values
    for (int i = 0; i < rtcLength; i++) {
      myFile.print(String(rtcMultiValue[j][i]) + ",");
    }

    //print dht22 values
    for (int i = 0; i < dhtLength; i++) {
      myFile.print(String(dhtMultiValue[j][i]) + ",");
    }

    if (outdoorModule == true) {

      //print bmp180 values
      for (int i = 0; i < bmpLength; i++) {
        myFile.print(String(bmpMultiValue[j][i]) + ",");
      }

      //print bh1750 values
      for (int i = 0; i < bh1750Length; i++) {
        myFile.print(String(bh1750MultiValue[j][i]) + ",");
      }

      //print wind sensor values
      for (int i = 0; i < windLength; i++) {
        myFile.print(String(windMultiValue[j][i]) + ",");
      }
    }

  }

  myFile.close();
  delay(1000);
  lcd.clear();
}

//printing factory

void printer(String text) {
  lcdPrint(text);

  Serial.println(text);
}

void printer(String text, String text1) {
  lcdPrint(text, text1);

  Serial.print("\n" + text);
  Serial.print(text1 + "\n");
}


void lcdPrint(String text)
{
  lcdLine(text);

  scrollText(text);
}

void lcdPrint(String text, String text1)
{
  lcdLine(text, text1);

  scrollText(text);
}

void scrollText(String text) {
  if (text.length() > 16)
  {
    for (int positionCounter = 0; positionCounter <= text.length() - 16; positionCounter++)
    {
      lcd.scrollDisplayLeft();
      delay(180);
    }

    delay(D[0]);

    for (int positionCounter = 0; positionCounter <= text.length() - 16; positionCounter++)
    {
      lcd.scrollDisplayRight();
      delay(180);
    }

    delay(D[0]);
  }
}


void lcdLine(String text) {
  lcd.setCursor(0, 0);
  lcd.print(text);
}


void lcdLine(String text, String text1) {
  lcd.setCursor(0, 0);
  lcd.print(text);

  lcd.setCursor(0, 1);
  lcd.print(text1);
}
