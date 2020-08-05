import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  static const sid = 'support';

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
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
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ChatHome.sid);
              },
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.solidComments,
                ),
                tooltip: 'Show Chat',
                onPressed: () {
                  _launchURL2();
                  //  Navigator.pushNamed(context, ChatHome.sid);
                },
              ),
            ),
          ],
          iconTheme: IconThemeData(
            color: color4,
          ),
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Support',
            style: text4,
          ),
        ),
        body: Container(
          color: color3,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 16),
                              child: Container(
                                width: width - 32,
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Support',
                                        style: text2.copyWith(
                                          color: color4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL("I want to report fraud"),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I want to report fraud',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL('Help with a disputed trade'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Help with a disputed trade',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                  'Problems with a Bitcoin transaction'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Problems with a Bitcoin transaction',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL('My account is hacked'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'My account is hacked',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL('I am a new user'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I am a new user',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap:
                                  _launchURL('My account is on forced holiday'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'My account is on forced holiday',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                  'I have a problem with my advertisement(s)'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I have a problem with my advertisement(s)',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                  'I have received abusive feedback'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I have received abusive feedback',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                'Report a bug',
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Report a bug',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap:
                                  _launchURL('I can\'t log in to my account'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I can\'t log in to my account',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap:
                                  _launchURL('I can\'t verify my home address'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I can\'t verify my home address',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                  'I am not able to verify my phone number'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I am not able to verify my phone number',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL('Feature requests'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Feature requests',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                'Identity verification problems',
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Identity verification problems',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL(
                                  'I want to verify my account as a company'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'I want to verify my account as a company',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: _launchURL('Other'),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color3, width: 0),
                                    color: color3,
                                  ),
                                  width: width - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Other',
                                      style: text13.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //min limit
                            //max limit name

                            //max limit Input

                            //next previous buttons
                            //buy bitcoins
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //whitecard
            ],
          ),
        ),
//
      ),
    );
  }
}

_launchURL(String message) async {
  String url =
      'https://asianbitcoins.org/verification/support_form.php?message=' +
          message;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'http://asianbitcoins.org/support/support_twak.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
