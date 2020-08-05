import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
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

Future<Post> fetchPost(String countrycode, String phone, String residence,
    String tradevol1, String tradevol2, String email, Currency currency) async {
  // BuildContext context;

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/updateprofile.php?email=' +
          email +
          '&countrycode=' +
          countrycode +
          '&key=anu5781' +
          '&phone=' +
          phone +
          '&step_two=true&residence=' +
          residence +
          '&tradevol1=' +
          tradevol1 +
          '&tradevol2=' +
          tradevol2 +
          '&currency=' +
          currency.currency);
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

class ProfileInformationThree extends StatefulWidget {
  static const sid = 'profile_information_three';

  @override
  _ProfileInformationThreeState createState() =>
      _ProfileInformationThreeState();
}

class _ProfileInformationThreeState extends State<ProfileInformationThree> {
  String countrycode;
  String phone;
  EstimatedTrade tradevol;
  String residencecountry;
  // String tradevol;
  String firstname = '';
  String lastname = '';
  String email = '';
  String selected_country = '';
  String political_status = '';
  Future<Post> post;
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    final profileinfo2_data args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    // firstname=args.firstname;
    //  lastname=args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    tradevol = args.tradevol;
    post = fetchPost(args.countrycode, args.phone, args.residencecountry,
        args.tradevol.limit1, args.tradevol.limit2, email, args.currency_ex);

    //addStringToSF(args.email);
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  String value;
  bool checkBoxVal = false;
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  double lastcontainerheight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 510 - 70 - 85;
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
              'Referral Code',
              style: text4,
            ),
          ),
          body: ListView(
            children: <Widget>[
              //container2 before main avtar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: color3,
                          radius: 50,
                          child: Icon(
                            FontAwesomeIcons.ticketAlt,
                            color: color2,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //mainavtarbox
              //container3 before mail
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              //container4 before thx
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: width - 32,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: text2.copyWith(fontSize: 20.0),
                          children: [
                            TextSpan(
                              text:
                                  'You can use referral code to get extra bonus !',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ), //thx text
              //container5 before notice
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: ' ',
                    style: text9,
                  ),
                ),
              ), //notice text
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                ),
                child: TextField(
                  onChanged: (text) {
                    value = text;
                    political_status = text;
                    print(value);
                  },
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
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  style: text7.copyWith(
                    letterSpacing: 15,
                  ),
                  cursorColor: color2,
                  cursorWidth: 3,
                ),
              ), //OTP Input
            ],
          ),
//
          bottomNavigationBar: Container(
            color: color2,
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileInformationTwo.sid);
                    },
                    child: Container(
                      color: color1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Previous',
                            style: text5.copyWith(
                              color: color4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey2.currentState.validate()) {
                        final FormState form = _formKey2.currentState;
                        form.save();

//                        if (checkBoxVal == false) {
//                          political_status = '1';
//                        } else {
//                          political_status = '0';
//                        }
                        Navigator.pushNamed(context, PhoneVerification.sid,
                            arguments: profileinfo3_data(
                                firstname,
                                lastname,
                                email,
                                countrycode,
                                residencecountry,
                                phone,
                                tradevol,
                                political_status));
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Next',
                          style: text5,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
