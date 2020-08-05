import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/screens/login/pin_set.dart';
import 'package:flutter/material.dart';
//components include
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/components/field_label.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/components/welcome_navigation_buttons.dart';

//screens
//buy
import 'package:asianbitcoins/screens/buy/buy_trade_explore.dart';
//chat
import 'package:asianbitcoins/screens/chat/chat_home.dart';
//dashboard
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
//explore
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
//extra
import 'package:asianbitcoins/screens/extra/trusted_people.dart';
//login
import 'package:asianbitcoins/screens/login/login_screen.dart';
//notification
import 'package:asianbitcoins/screens/notification/notification_home.dart';
//reading
import 'package:asianbitcoins/screens/reading/faq.dart';
import 'package:asianbitcoins/screens/reading/fees.dart';
import 'package:asianbitcoins/screens/reading/guide.dart';
import 'package:asianbitcoins/screens/reading/help.dart';
import 'package:asianbitcoins/screens/reading/how_to_buy.dart';
import 'package:asianbitcoins/screens/reading/support.dart';
//sell
import 'package:asianbitcoins/screens/sell/sell_trade_explore.dart';
//signup
import 'package:asianbitcoins/screens/signup/email_verification.dart';
import 'package:asianbitcoins/screens/signup/phone_verification.dart';
import 'package:asianbitcoins/screens/signup/privacy_policy.dart';
import 'package:asianbitcoins/screens/signup/profile_information_one.dart';
import 'package:asianbitcoins/screens/signup/profile_information_two.dart';
import 'package:asianbitcoins/screens/signup/profile_information_three.dart';
import 'package:asianbitcoins/screens/signup/signup_screeen_one.dart';
import 'package:asianbitcoins/screens/signup/teram_of_service.dart';
import 'package:asianbitcoins/screens/signup/two_factor.dart';
//wallet
import 'package:asianbitcoins/screens/wallet/wallet_send.dart';
//welcome navigation alone screen
import 'package:asianbitcoins/screens/welcome_navigation.dart';
//utilites
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:asianbitcoins/utilites/functionality.dart';
//packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

//int count=0;
Future<Post> fetchPost2(String pass, String email) async {
  // BuildContext context;
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/login.php?email=' +
          email +
          '&key=anu5781&pass=' +
          pass);
  if (response.statusCode == 200) {
    // count++;
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

addStringToSF(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

class TwoFactor extends StatefulWidget {
  static const sid = 'two_factor';

  @override
  _TwoFactorState createState() => _TwoFactorState();
}

class _TwoFactorState extends State<TwoFactor> {
  String value;
  String otp;
  Future<Post> post;
  String email;
  String countrycode;
  String phone;
  EstimatedTrade tradevol;
  String residencecountry;
  // String tradevol;
  String firstname = '';
  String lastname = '';
  // String email='';
  String selected_country = '';
  // String value;
  bool checkboxval = true;
  // String email='';
  // String otp='';
  String politically_exposed;
  double lastcontainerheight;

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    final LoginCredentials args = ModalRoute.of(context).settings.arguments;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      email = args.email;
      post = fetchPost2(args.password, args.email);

      //  print(MediaQuery.of(context).size);
    });
    addStringToSF(args.email);
  }

  /* void didChangeDependencies() {
   // super.didChangeDependencies();
   // final LoginCredentials args = ModalRoute.of(context).settings.arguments;
  } */
  /*
  @override
  void initState() {
    final LoginCredentials args = ModalRoute.of(context).settings.arguments;
    email=args.email;
    // politically_exposed=args.politically_exposed;
    //  firstname=args.firstname;
    //  lastname=args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    post = fetchPost2(args.password,args.email);
   // _future = callAsyncFetch();
    super.initState();
  } */
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    lastcontainerheight = height - 410 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }
//    return Container(
//      child:Form(
//        key: _formKey2,
//        autovalidate: _autoValidate,
//        child: Scaffold(
//          appBar: AppBar(
//            iconTheme: IconThemeData(
//              color: color4,
//            ),
//            centerTitle: true,
//            elevation: 0.0,
//            leading: GestureDetector(
//              onTap: () {
//                Navigator.pop(context);
//              },
//              child: Icon(FontAwesomeIcons.chevronLeft),
//            ),
//            title: Text(
//              'Two Factor',
//              style: text4,
//            ),
//          ),
//          body: StaggeredGridView.count(
//            shrinkWrap: true,
//            crossAxisCount: 2,
//            children: <Widget>[
//              Container(
//                height: 10,
//              ),
//              Center(
//                child: FieldLabel(
//                  title: 'OTP',
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(
//                  left: 32.0,
//                  right: 32.0,
//                ),
//                child: TextFormField(
//                  onChanged: (text) {
//                    value = text;
//                    print(value);
//                  },
//                  onSaved: (val) => setState(() => otp = val),
//                  textAlign: TextAlign.center,
//                  maxLength: 6,
//                  decoration: InputDecoration(
//                    hintText: '',
//                    hintStyle: text8,
//                    border: UnderlineInputBorder(
//                      borderSide: BorderSide(
//                        color: color2,
//                        width: 2,
//                      ),
//                    ),
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(
//                        color: color2,
//                        width: 2,
//                      ),
//                    ),
//                    focusedBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(
//                        color: color2,
//                        width: 3,
//                      ),
//                    ),
//                  ),
//                  autofocus: true,
//                  keyboardType: TextInputType.number,
//                  style: text7.copyWith(
//                    letterSpacing: 15,
//                  ),
//                  cursorColor: color2,
//                  cursorWidth: 3,
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Column(
//                      children: <Widget>[
//                        Text(
//                          'Resend OTP',
//                          style: text6,
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//
//              //otp clear
//              Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: RichText(
//                  textAlign: TextAlign.center,
//                  text: TextSpan(
//                    text: 'OTP has been sent you by email and phone',
//                    style: text9,
//                  ),
//                ),
//              ),
//              //info clear
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        GestureDetector(
//                          onTap: () {
//                            Navigator.pushNamed(context, SignUpScreenOne.sid);
//                          },
//                          child: Text(
//                            'Sign Up now !',
//                            style: text6.copyWith(
//                              color: color6,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ],
//            staggeredTiles: [
//              StaggeredTile.extent(2, 100), //firstpad contianer
//              StaggeredTile.extent(2, 100), //OTP label
//              StaggeredTile.extent(2, 60), //email input
//              StaggeredTile.extent(2, 50), //Resend OTP
//
//              StaggeredTile.extent(2, 100), //Info text
//
//              StaggeredTile.extent(2, lastcontainerheight), //lastcontainerheight
//            ],
//          ),
//          bottomNavigationBar: BottomOne(
//            colour: color2,
//            text: 'Continue',
//            ontap: () {
//              if (_formKey2.currentState.validate()) {
//                final FormState form = _formKey2.currentState;
//                form.save();
//                Navigator.pushNamed(context, BuyCoinDashboard.sid,arguments: phone_verification_data(firstname, lastname, email, countrycode, residencecountry, phone, tradevol, politically_exposed, otp));}
//            },
//            textStyle: text5,
//          ),
//        ),
//
//      ),);

    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.message == "1") {
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
                      'Two Factor',
                      style: text4,
                    ),
                  ),
                  body: StaggeredGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        height: 10,
                      ),
                      Center(
                        child: FieldLabel(
                          title: 'OTP',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 32.0,
                          right: 32.0,
                        ),
                        child: TextFormField(
                          onChanged: (text) {
                            value = text;
                            print(value);
                          },
                          onSaved: (val) => setState(() => otp = val),
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: text8,
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
                          style: text7.copyWith(
                            letterSpacing: 15,
                          ),
                          cursorColor: color2,
                          cursorWidth: 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    send_otp();
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

                      // otp clear
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'OTP has been sent you by email and phone',
                            style: text9,
                          ),
                        ),
                      ),
                      // info clear
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SignUpScreenOne.sid);
                                  },
                                  child: Text(
                                    'Sign Up now !',
                                    style: text6.copyWith(
                                      color: color6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                    staggeredTiles: [
                      StaggeredTile.extent(2, 100), //firstpad contianer
                      StaggeredTile.extent(2, 100), //OTP label
                      StaggeredTile.extent(2, 60), //email input
                      StaggeredTile.extent(2, 50), //Resend OTP

                      StaggeredTile.extent(2, 100), //Info text

                      StaggeredTile.extent(
                          2, lastcontainerheight), //lastcontainerheight
                    ],
                  ),
                  bottomNavigationBar: BottomOne(
                    colour: color2,
                    text: 'Continue',
                    ontap: () {
                      if (_formKey2.currentState.validate()) {
                        final FormState form = _formKey2.currentState;
                        form.save();
                        verify_otp(context, email, otp);
                      }
                    },
                    textStyle: text5,
                  ),
                ),
              ),
            );
          }
          if (snapshot.data.message == "0") {
            return Text("failed");
          }
          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          //return Text("Fuck You");
        }

        return Dialog(
          child: Container(
            color: Color.fromRGBO(18, 18, 18, 1),
            child: new Row(
              //     height: 10,
              mainAxisSize: MainAxisSize.max,
              children: [
                new Container(
                  height: 70,
                  margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  /*  child: ColorLoader(
                                            colors: colors,
                                            duration: Duration(milliseconds: 1200)
                                        ),*/
                ),
                new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(62, 212, 0, 1),
                  ),
                ),
                new SizedBox(
                  width: 20,
                ),
                //     new Container(margin: EdgeInsets.fromLTRB(0,0,5,0),),
                new Text(
                  "Loading",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );

        // By default, show a loading spinner.
        //     return CircularProgressIndicator();
      },
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

  void verify_otp(context, String email, String otp) async {
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
        Navigator.pushNamed(context, BuyCoinDashboard.sid,
            arguments: phone_verification_data(
                firstname,
                lastname,
                email,
                countrycode,
                residencecountry,
                phone,
                tradevol,
                politically_exposed,
                otp));

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
            title: "Login",
            desc: "OTP Resent Successfully")
        .show();
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
        _onBasicAlertPressed5(context);
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
