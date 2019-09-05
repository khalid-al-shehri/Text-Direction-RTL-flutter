import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {

  runApp(MaterialApp(

    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale: Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales,

    debugShowCheckedModeBanner: false,
    title: "Test",
    home: MyApp(),

    theme: ThemeData(
      primaryColor: Colors.white, // AppBar, border of textField //Light_blue
      accentColor: Colors.white, //Shadow from swipe up or down
      pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
      )

    ),
  ));
}


class MyApp extends StatefulWidget {

  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {


  var _formkey = GlobalKey<FormState>();

  TextEditingController NationalId = TextEditingController();
  TextEditingController Mobile = TextEditingController();

  var rng = new Random(); // For Captcha
  int randomCode; // store Captcha code here

//  TextEditingController captchaCode = TextEditingController(); // to check if user write the same code or not

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          // Press back from device
        },

    child: Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blue,

        iconTheme: new IconThemeData(color: Colors.white),

        title: Text("تسجيل الدخول", style: TextStyle(color: Colors.white)),

        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child : Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[

                    // National ID Text Field
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white,), // color of text when user write
                        maxLength: 10, // max length of text, after 10 the user can not write more.
                        keyboardType: TextInputType.number, // type of keyboard
                        controller: NationalId, //when user write, the value from user will saved here.
                        validator: (String value) { // for validation
                          if (value.isEmpty) {

                            return 'يجب ادخال رقم الهوية';
                          }
                          else if (value.length < 10) {
                            return 'رقم الهوية غير صحيح ، حاول مره اخرى';
                          }
                          else{

                          }
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white), // color of title for text field
                            hintStyle: TextStyle(color: Colors.white30), // color of hint for text field
                            counterText: "", // to hide counter for length
                            labelText: 'رقم الهوية', // title of text field
                            hintText: 'الرجاء ادخال رقم الهوية', // hint of text field
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white.withOpacity(0.40), width: 1.0), // color of border of text field
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0) // radius of border
                            )
                    ),
                      ),
                    ),

                    // Mobile Text Field
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white,),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: Mobile,
                        validator: (String value) {

                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white30),
                            counterText: "",
                            labelText: 'رقم الجوال',
                            hintText: 'الرجاء ادخال رقم الجوال',
                            enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.white.withOpacity(0.40), width: 1.0), // color of border of text field
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),

                    // Raised Button
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5, top: 15),
                            child: Container(
                              height: 50,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)
                                    ),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('تسجيل الدخول', textScaleFactor: 1, style: TextStyle(color: Colors.white),),
                                    onPressed: () {
                                      setState(() {
                                        if (_formkey.currentState.validate()) {
                                          // Here move to next page, if all condations are ok.



                                        }
                                      });
                                    })
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          ),
        ),
        color: Colors.black87,
      ),

    )
    );
  }

  int RandomCode(){

    randomCode = 1000 + rng.nextInt(10000 - 1000);

    return randomCode;
    // Variable = min + rng.nextInt(max - min);

  }

}



