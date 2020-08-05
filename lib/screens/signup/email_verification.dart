import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/screens/signup/profile_information_one.dart';
import 'package:asianbitcoins/screens/signup/signup_screeen_one.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class EmailVerification extends StatefulWidget {
  static const sid = 'email_verification';

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  String value;
  bool checkboxval = true;
  String email = '';
  String pass = '';
  String name = '';
  double lastcontainerheight;

  @override
  Widget build(BuildContext context) {
    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    pass = args.pass;
    name = args.name;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 505 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }

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
            child: Icon(FontAwesomeIcons.chevronLeft),
          ),
          title: Text(
            'Email Verification',
            style: text4,
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 40,
                ),
              ), //noofprocess label
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: color3,
                        radius: 50,
                        child: Icon(
                          FontAwesomeIcons.envelope,
                          color: color2,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ), //mainavtarbox
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: width - 32,
                          child: Text(
                            email,
                            style: text1.copyWith(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //email show

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width - 16,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: text2.copyWith(fontSize: 20.0),
                          children: [
                            TextSpan(
                              text: 'Thank You For Choosing asianbitcoins.org',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ), //thx text

              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 32,
                  bottom: 32,
                ),
                child: Container(
                  width: width - 32,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'Confirm your email address by clicking the link we have sent to ' +
                              email,
                      style: text9,
                    ),
                  ),
                ),
              ), //notice text

              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreenOne.sid);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width - 48 - 64,
                              child: Text(
                                'Wrong Email ? Click Here ',
                                style: text2.copyWith(
                                  fontSize: 15.0,
                                  letterSpacing: 0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          borderSide: BorderSide(
                            color: color2,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //flatebutton

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            resend_mail(context, email);
                          },
                          child: Container(
                            width: width - 32,
                            child: Text(
                              'Haven\' received the verificaiton  link ? ',
                              style: text6.copyWith(
                                color: color6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //lastsignin button
            ],
          ),
        ),
        bottomNavigationBar: BottomOne(
          colour: color2,
          text: 'Next',
          ontap: () {
            verifyemail();
          },
          textStyle: text5,
        ),
      ),
    );
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
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Email Verification",
            desc: "Email Verification Failed")
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
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Email Verification",
            desc: "Email Resent Successfully")
        .show();
  }

  void verifyemail() async {
    final response = await http.get(
        'https://asianbitcoins.org/emailverify/checkemailverify.php?key=anu5781' +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        Navigator.pushNamed(context, ProfileInformationOne.sid,
            arguments: Signups1Credentials(name, pass, email));
        // return releasetrade(con_id);
      } else {
        return _onBasicAlertPressed5(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void resend_mail(BuildContext context, String email) async {
    final response = await http.get(
        'https://asianbitcoins.org/emailverify/resend_v_email.php?key=anu5781' +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return _onBasicAlertPressed6(context);
      } else {}
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
