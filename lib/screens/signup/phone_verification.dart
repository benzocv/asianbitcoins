import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost(String politically_active, String email) async {
  // BuildContext context;

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/updateprofile.php?email=' +
          email +
          '&key=anu5781&step_three=true&politically_status=' +
          politically_active);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  String message;
  // String id;
//  final String title;
//  final String body;

  Post({this.message});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      // id: json['id'],
      //   title: json['title'],
      //  body: json['body'],
    );
  }
}

class PhoneVerification extends StatefulWidget {
  static const sid = 'phone_verification';

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String countrycode;
  String phone;
  EstimatedTrade tradevol;
  String residencecountry;
  // String tradevol;
  String firstname = '';
  String lastname = '';
  String email = '';
  String selected_country = '';
  String value;
  bool checkboxval = true;
  // String email='';
  String otp = '';
  String politically_exposed;

  double lastcontainerheight;
  /* addStringToSF(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  } */
  /* void initState() {
    addStringToSF(email);
  } */

  void didChangeDependencies() {
    super.didChangeDependencies();
    final profileinfo3_data args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    Future<Post> post;
    politically_exposed = args.politically_exposed;
    //  firstname=args.firstname;
    //  lastname=args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    post = fetchPost(args.politically_exposed, args.email);
  }

  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    lastcontainerheight = height - 535 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }

    return Container(
      child: Form(
        key: _formKey2,
        autovalidate: _autoValidate,
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
              'Phone Verification',
              style: text4,
            ),
          ),
          body: StaggeredGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                height: 10,
              ), //First Container Ends
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: color3,
                          child: Text(
                            '3',
                            style: text2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' of 3 ',
                          style: text10.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //noofprocess label
              Container(
                height: 10,
              ), //container2 before main avtar

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
                          FontAwesomeIcons.phoneAlt,
                          color: color2,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ), //mainavtarbox

              Container(
                height: 10,
              ), //container3 before mail

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '123456', //you need to change here
                        style: text1.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ), //email show

              Container(
                height: 10,
              ), //container4 before thx

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: text2.copyWith(fontSize: 20.0),
                      children: [
                        TextSpan(
                          text: 'Your Account Is \n Almost Ready !',
                        ),
                      ],
                    ),
                  ),
                ],
              ), //thx text
              Container(
                height: 10,
              ), //container5 before notice

              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Insert the OTP we send to ' +
                        '123456' +
                        ' to complete registration.',
                    style: text9,
                  ),
                ),
              ), //notice text

              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                ),
                child: TextFormField(
                  onSaved: (val) => setState(() => otp = val),
                  onChanged: (text) {
                    value = text;
                    print(value);
                  },
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: text7.copyWith(
                    letterSpacing: 15,
                  ),
                  cursorColor: color2,
                  cursorWidth: 3,
                ),
              ), //OTP Input

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
                            //  Navigator.pop(context);
                            send_otp();

//                          Navigator.pushNamed(context, LoginScreen.sid);
                          },
                          child: Text(
                            'Resend OTP',
                            style: text6.copyWith(
                              color: color6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //lastsignin button
            ],
            staggeredTiles: [
              StaggeredTile.extent(2, 10), //first contianer
              StaggeredTile.extent(2, 40), //Noofprocess label
              StaggeredTile.extent(2, 20), //container2 beforemainavtar
              StaggeredTile.extent(2, 100), //mainavtar box
              StaggeredTile.extent(2, 10), //container3 before email box

              StaggeredTile.extent(2, 25), //email show
              StaggeredTile.extent(2, 20), //Container4 before thx

              StaggeredTile.extent(2, 60), //thx text
              StaggeredTile.extent(2, 20), //Container5 before notice

              StaggeredTile.extent(2, 150), //notice text

              StaggeredTile.extent(2, 80), //OTP input input

              StaggeredTile.extent(
                  2, lastcontainerheight), //lastcontainerheight
            ],
          ),
          bottomNavigationBar: BottomOne(
            colour: color2,
            text: 'Next',
            ontap: () {
              if (_formKey2.currentState.validate()) {
                final FormState form = _formKey2.currentState;
                form.save();
                verify_otp(context);
              }
            },
            textStyle: text5,
          ),
        ),
      ),
    );
  }

  _onBasicAlertPressed4(context) {
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
            title: "Forgot Password",
            desc: "OTP verification failed")
        .show();
  }

  void verify_otp(context) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/verify_otp.php?key=anu5781' +
            '&email=' +
            email +
            '&otp=' +
            otp);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value["message"] == "1") {
        Navigator.pushNamed(
          context,
          BuyCoinDashboard.sid,
          arguments: phone_verification_data(
              firstname,
              lastname,
              this.email,
              countrycode,
              residencecountry,
              phone,
              tradevol,
              politically_exposed,
              this.otp),
        );

        //Navigator.pushNamed(context, SetNewPassword.sid, arguments: email);
      }
      if (value["message"] == "0") {
        return _onBasicAlertPressed4(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void send_otp() async {
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
        // return releasetrade(con_id);
      } else {
        //return _onBasicAlertPressed4(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
