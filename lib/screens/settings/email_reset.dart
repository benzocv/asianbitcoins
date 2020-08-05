//email_reset is actually phone no reset
import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

_onBasicAlertPressed(context) {
  Alert(
          context: context,
          buttons: [
            DialogButton(
                color: color2,
                child: Text(
                  "Okay",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SettingProfile.sid);
                })
          ],
          title: "Phone Change",
          desc: "Successful")
      .show();
}

_onBasicAlertPressed2(context) {
  Alert(
          context: context,
          buttons: [
            DialogButton(
                color: color2,
                child: Text(
                  "Okay",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, EmailReset.sid);
                })
          ],
          title: "Phone Change",
          desc: "Incorrect OTP")
      .show();
}

Future<String> fetchPost(String otp, String new_phn, context) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/phone_change.php?key=anu5781&email=' +
          email +
          '&otp=' +
          otp +
          '&new_phn=' +
          new_phn);
  if (response.statusCode == 200) {
    //  value=json.decode(response.body);
    // count++;
    // If the call to the server was successful, parse the JSON.
    Map<String, dynamic> value = json.decode(response.body);

    if (value['message'] == "1") {
      _onBasicAlertPressed(context);
    } else {
      _onBasicAlertPressed2(context);
    }

    // return  _onBasicAlertPressed(context);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class EmailReset extends StatefulWidget {
  static const sid = 'email_reset';

  @override
  _EmailResetState createState() => _EmailResetState();
}

class _EmailResetState extends State<EmailReset> {
  String value;
  double lastcontainerheight;
  bool checkboxval = true;
  String new_phn;
  String otp;
  bool sendotp60 = false;
  int countdown = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost("1", "1", context);

    Future.delayed(const Duration(milliseconds: 60000), () {
      setState(() {
        sendotp60 = true;
      });
    });
  }

  int otp_count = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: color4,
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change Mobile No',
          style: text4,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 32, bottom: 16, left: 8, right: 8),
              child: Container(
                width: width - 32,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Change mobile number',
                        style: text2.copyWith(
                          color: color4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Container(
                width: width - 32,
                child: Text(
                  'OTP Code',
                  style: text4,
                ),
              ),
            ), //phone number title
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                onChanged: (text) {
                  value = text;
                  otp = text;
                  print(value);
                },
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: text8,
                  helperText:
                      'Please enter the OTP Code sent to your registered mobile no to verify',
                  helperStyle: text11,
                  helperMaxLines: 5,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: color2,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: color2,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: color2,
                      width: 3,
                    ),
                  ),
                ),
                autofocus: false,
                keyboardType: TextInputType.number,
                style: text7,
                cursorColor: color2,
                cursorWidth: 3,
              ),
            ), //phonenumebr Input

            Visibility(
              visible: sendotp60,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            send_otp();
                            setState(() {
                              sendotp60 = false;
                            });
                            Future.delayed(const Duration(milliseconds: 60000),
                                () {
                              setState(() {
                                sendotp60 = true;
                              });
                            });
                          },
                          child: Text(
                            'Resend OTP',
                            style: text6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ), //resend otp
            Visibility(
              visible: !sendotp60,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Wait $countdown seconds to appear Resend OTP ',
                            style: text6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ), //resend otp will appear

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                width: width - 32,
                child: Text(
                  'New mobile no',
                  style: text4,
                ),
              ),
            ), //phone number title
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                onChanged: (text) {
                  new_phn = text;
                  value = text;
                  print(value);
                },
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: text8,
                  helperText: '',
                  helperStyle: text11,
                  helperMaxLines: 5,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: color2,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: color2,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: color2,
                      width: 3,
                    ),
                  ),
                ),
                autofocus: false,
                keyboardType: TextInputType.number,
                style: text7,
                cursorColor: color2,
                cursorWidth: 3,
              ),
            ), //phonenumebr Input

            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Container(
                width: width - 16,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              fetchPost(otp, new_phn, context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'Change Mobile Number',
                                style: text2.copyWith(
                                  fontSize: 12.0,
                                  letterSpacing: 0,
                                  color: color2,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: color2,
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
//
    ));
  }

  _onBasicAlertPressed5(context) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            title: "Phone Reset",
            desc: "OTP Resent Successfully")
        .show();
  }

  _onBasicAlertPressed6(context) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            title: "OTP",
            desc: "Max limit of three otp reached")
        .show();
  }

  void send_otp() async {
    if (otp_count < 3) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      String email = prefs.getString('email');
      final response = await http.get(
          'https://asianbitcoins.org/abc/api/send_otp.php?key=anu5781' +
              '&email=' +
              email);
      if (response.statusCode == 200) {
        // count++;
        // If the call to the server was successful, parse the JSON.
        //return Post.fromJson(json.decode(response.body));

        Map<String, dynamic> value = json.decode(response.body);
        if (value['message'] == "1") {
          otp_count++;
          _onBasicAlertPressed5(context);
          // return releasetrade(con_id);

        } else {
          //return _onBasicAlertPressed4(context);
        }
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      }
    } else {
      _onBasicAlertPressed6(context);
    }
  }
}
