import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/screens/extra/referral_income.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<TransactionsList> fetchPost2() async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/myrefrall.php?key=anu5781&email=' +
          email);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    // count++;
    return TransactionsList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class TransactionsList {
  final List<Post2> transactions;

  TransactionsList({
    this.transactions,
  });

  factory TransactionsList.fromJson(List<dynamic> parsedJson) {
    List<Post2> transactions = new List<Post2>();
    transactions = parsedJson.map((i) => Post2.fromJson(i)).toList();

    return TransactionsList(transactions: transactions);
  }
}

class Post2 {
  String message;
  String name;
  String joindate;
  String jointime;
  String ref_income;
  String uid;
  String uname;
  // String id;
//  final String title;
//  final String body;

  Post2(
      {this.message,
      this.name,
      this.joindate,
      this.jointime,
      this.ref_income,
      this.uid,
      this.uname});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
        message: json['message'],
        name: json["name"],
        joindate: json["joindate"],
        jointime: json["jointime"],
        ref_income: json["ref_income"],
        uid: json["uid"],
        uname: json["uname"]

        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class MyReferral extends StatefulWidget {
  static const sid = 'my_referral';

  @override
  _MyReferralState createState() => _MyReferralState();
}

class _MyReferralState extends State<MyReferral> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  Future<TransactionsList> post2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post2 = fetchPost2();
  }

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
    return FutureBuilder<TransactionsList>(
      future: post2,
      builder: (context, snapshot) {
        //   */
        if (snapshot.hasData) {
          List<Widget> list = new List();
          list.add(
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                color: color1,
                width: width - 32,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Your Referral Code : ",
                              style: text3.copyWith(
                                color: color4,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            SelectableText(
                              snapshot.data.transactions[0].uname +
                                  snapshot.data.transactions[0].uid,
                              style: text3.copyWith(
                                color: color2,
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
//                  child: RichText(
//                    textAlign: TextAlign.left,
//                    text: TextSpan(
//                      children: [
//                        TextSpan(
//                          text: "My Referall Code Is :\t",
//                          style: text3.copyWith(
//                            color: color4,
//                            fontSize: 15,
//                          ),
//                        ),
//                        TextSpan(
//                          text: snapshot.data.transactions[0].uname +
//                              snapshot.data.transactions[0].uid,
//                          style: text3.copyWith(
//                            color: color2,
//                            fontSize: 20,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
                ),
              ),
            ),
          );
          for (int i = 1; i < snapshot.data.transactions.length; i++) {
            if (snapshot.data.transactions[i].message == "1") {
              list.add(
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ReferralIncome.sid,
                        arguments: refrall(snapshot.data.transactions[i].name,
                            snapshot.data.transactions[i].uid));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      color: color1.withOpacity(0.5),
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
                                      const EdgeInsets.only(top: 8, bottom: 0),
                                  child: Container(
                                    width: width - 32,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Name\t',
                                            style: text13,
                                          ),
                                          TextSpan(
                                            text: snapshot
                                                .data.transactions[i].name,
                                            style: text14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 0),
                                  child: Container(
                                    width: width - 32,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Total Income\t',
                                            style: text13,
                                          ),
                                          TextSpan(
                                            text: snapshot.data.transactions[i]
                                                .ref_income,
                                            style: text14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 0),
                                  child: Container(
                                    width: width - 32,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Join Date\t',
                                            style: text13,
                                          ),
                                          TextSpan(
                                            text: snapshot.data.transactions[i]
                                                    .joindate +
                                                '\t' +
                                                snapshot.data.transactions[i]
                                                    .jointime,
                                            style: text14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ), //whitecard
              ); //whitecard

            }
          }

          return Container(
              child: Scaffold(
            drawer: SideBar(),
            backgroundColor: color3,
            appBar: AppBar(
              actions: <Widget>[
//                GestureDetector(
//                  onTap: () {
//                    Navigator.pushNamed(context, ChatHome.sid);
//                  },
//                  child: IconButton(
//                    icon: const Icon(
//                      FontAwesomeIcons.solidComments,
//                    ),
//                    tooltip: 'Show Chat',
//                    onPressed: () {
//                      Navigator.pushNamed(context, ChatHome.sid);
//                    },
//                  ),
//                ),
//                IconButton(
//                  icon: const Icon(FontAwesomeIcons.solidBell),
//                  tooltip: 'Show Notifications',
//                  onPressed: () {
//                    Navigator.pushNamed(context, NotificationHome.sid);
//                  },
//                ),
              ],
              iconTheme: IconThemeData(
                color: color4,
              ),
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                'My Referral',
                style: text4,
              ),
            ),
            body: Container(
              child: ListView(children: list),
            ),
//
          ));
          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          //  return Text("Fuck You");
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
}
