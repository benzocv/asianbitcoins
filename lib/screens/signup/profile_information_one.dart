import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/screens/signup/profile_information_two.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInformationOne extends StatefulWidget {
  static const sid = 'profile_information_one';

  @override
  _ProfileInformationOneState createState() => _ProfileInformationOneState();
}

class _ProfileInformationOneState extends State<ProfileInformationOne> {
  String value;
  bool checkboxval = true;
  String email = '';
  String pass = '';
  String name = '';
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _firstname = '';
  String _lastname = '';

  double lastcontainerheight;

  @override
  Widget build(BuildContext context) {
    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;

    email = args.email;
    pass = args.pass;
    name = args.name;
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
              'Profile Information',
              style: text4,
            ),
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                //First Container Ends
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
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
                              '1',
                              style: text2,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 40,
                            child: Text(
                              ' of 3 ',
                              style: text10.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //noofprocess label

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
                              FontAwesomeIcons.infinity,
                              color: color2,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //mainavtarbox

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
                              style:
                                  text1.copyWith(fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //email show

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Container(
                    width: width - 32,
                    child: Text(
                      'First Name',
                      style: text4,
                    ),
                  ),
                ), //first name title

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: TextFormField(
                    onSaved: (val) => setState(() => _firstname = val),
                    validator: (value) {
                      if (value.isEmpty) {
                        //_autoValidate=true;
                        return 'first name cannot be empty';
                      }

                      return null;
                    },
                    onChanged: (text) {
                      value = text;
                      print(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: text8,
                      helperText:
                          'Enter your first name as they appear on your idendity documentation.',
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
                    keyboardType: TextInputType.text,
                    style: text7,
                    cursorColor: color2,
                    cursorWidth: 3,
                  ),
                ), //firstname Input

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Container(
                    width: width - 32,
                    child: Text(
                      'Last Name',
                      style: text4,
                    ),
                  ),
                ), //last name title

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        //_autoValidate=true;
                        return 'Please enter last name';
                      }

                      return null;
                    },
                    onSaved: (val) => setState(() => _lastname = val),
                    onChanged: (text) {
                      value = text;
                      print(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: text8,
                      helperText:
                          'Enter your first name as they appear on your idendity documentation.',
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
                    keyboardType: TextInputType.text,
                    style: text7,
                    cursorColor: color2,
                    cursorWidth: 3,
                  ),
                ), //lastname Input

                //lastsignin button
              ],
            ),
          ),
          bottomNavigationBar: BottomOne(
            colour: color2,
            text: 'Next',
            ontap: () {
              if (_formKey2.currentState.validate()) {
                final FormState form = _formKey2.currentState;
                form.save();
                Navigator.pushNamed(context, ProfileInformationTwo.sid,
                    arguments: profileinfo1_data(_firstname, _lastname, email));
              } else {
                _autoValidate = true;
              }
            },
            textStyle: text5,
          ),
        ),
      ),
    );
  }
}
