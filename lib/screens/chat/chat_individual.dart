import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/components/chat_count.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//components include
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/components/field_label.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/components/welcome_navigation_buttons.dart';
import 'package:flutter/services.dart';
//screens
//buy
import 'package:asianbitcoins/screens/buy/buy_trade_explore.dart';
//chat
import 'package:asianbitcoins/screens/chat/chat_home.dart';
import 'package:asianbitcoins/screens/chat/chat_individual.dart';
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
import 'package:asianbitcoins/main.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

File file;
Future<void> _upload(String user_two, String con_id) async {
  //file = await ImagePicker.pickImage(source: ImageSource.camera);
  file = await ImagePicker.pickImage(source: ImageSource.gallery);
  if (file == null) return;
  String base64Image = base64Encode(file.readAsBytesSync());
  String fileName = file.path.split("/").last;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  http.post("https://asianbitcoins.org/abc/api/chat_image_post.php", body: {
    "key": "anu5781",
    "email": email,
    "con_id": con_id,
    "user_two": user_two,
    "image": base64Image,
    "name": fileName,
  }).then((res) {
    print(res.statusCode);
  }).catchError((err) {
    print(err);
  });
}

Future<Post> fetchPost(String message, String user_two, String con_id) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/send_message.php?key=anu5781&email=' +
          email +
          '&user_two=' +
          user_two +
          '&con_id=' +
          con_id +
          '&message=' +
          message);
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

Future<TransactionsList> fetchPost2(String con_id, String user_two) async {
  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  // String otp=prefs.getString('otp');

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/chat_individual.php?key=anu5781&email=' +
          email +
          '&con_id=' +
          con_id +
          '&user_two=' +
          user_two);
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
  String user_one;
  String message_recent;
  String user_two;
  String admin;
  String is_image;
  String buyer_email;
  String seller_email;
  String trade_info;
  String trade_status;
  String id;
  String date;
  String time;

  // String id;
//  final String title;
//  final String body;

  Post2(
      {this.message,
      this.user_one,
      this.message_recent,
      this.user_two,
      this.admin,
      this.is_image,
      this.buyer_email,
      this.seller_email,
      this.trade_info,
      this.trade_status,
      this.id,
      this.date,
      this.time});

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
        message: json['message'],
        user_one: json["user_one"],
        message_recent: json["message_recent"],
        user_two: json["user_two"],
        admin: json["admin"],
        is_image: json["is_image"],
        buyer_email: json["buyer_email"],
        seller_email: json["seller_email"],
        trade_info: json["trade_info"],
        trade_status: json["trade_status"],
        id: json["id"],
        date: json["date"],
        time: json["time"]

        // id: json['id'],
        //   title: json['title'],
        //  body: json['body'],
        );
  }
}

class ChatIndividual extends StatefulWidget {
  static const sid = 'chat_individual';

  @override
  _ChatIndividualState createState() => _ChatIndividualState();
}

class _ChatIndividualState extends State<ChatIndividual> {
  String value;
  bool checkBoxVal = false;
  bool isDrawerOpen = true;
  double lastcontainerheight;
  String username;
  Future<TransactionsList> post2;
  String message;
  bool r_btc = true;
  bool c_btc = true;
  bool closed_btc = false;
  bool d_btc = true;
  String email;
  String con_ids;
  chat_home_data varr;
/*
  void initState() {
    super.initState();
    final chat_home_data args = ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration.zero, () {
      //This setState is necessary because it refreshes the listView
      setState(() {});
    });
    try{
      post2=fetchPost2(args.con_id,args.user_two);
    }
    catch(e)
    {

    }



    //    final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    // email=args.email;
    //   final Signups1Credentials args = ModalRoute.of(context).settings.arguments;
    // email=args.email;
//  String email='anusa@gmail.com';
    //  String pass='anu5781';
    //  post = fetchPost(name,email,pass);
    //  print(MediaQuery.of(context).size);

    // addStringToSF(email);
  }
*/
  String user_2;
  FocusNode myFocusNode;
  void initState() {
    super.initState();
    final chat_home_data args = ModalRoute.of(context).settings.arguments;
    user_2 = args.user_two;
    con_ids = args.con_id;
    varr = args;
    get_email() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      email = prefs.getString('email');
    }

    get_email();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      post2 = fetchPost2(con_ids, user_2);
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {
      post2 = fetchPost2(con_ids, user_2);
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // post2.add((items.length+1).toString());
    if (mounted)
      setState(() {
        post2 = fetchPost2(con_ids, user_2);
      });
    _refreshController.loadComplete();
  }

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final chat_home_data args = ModalRoute.of(context).settings.arguments;
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
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Container(
                color: color3,
                width: width - 32,
                child: Padding(
                  padding: const EdgeInsets.all(0.0), //this was 8
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: snapshot.data.transactions[0].trade_info,
                          style: text3.copyWith(
                            color: color4,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
//          list.add(
//            Padding(
//              padding: const EdgeInsets.only(top: 8, bottom: 16),
//              child: Container(
//                width: width - 32,
//                child: RichText(
//                  textAlign: TextAlign.left,
//                  text: TextSpan(
//                    children: [
//                      TextSpan(
//                        text: 'Chat',
//                        style: text2.copyWith(
//                          color: color4,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          );
          if (snapshot.data.transactions[0].trade_status == "closed") {
            list.add(
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: width * 0.7 - 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: color2, width: 2),
                        ),
                        child: TextField(
                          focusNode: myFocusNode,
                          controller: _controller,
                          onChanged: (text) {
                            message = text;
                          },

                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            hintStyle: text8.copyWith(
                              fontSize: 15,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          //  autofocus: true,
                          keyboardType: TextInputType.text,
                          style: text7,
                          cursorColor: color2,
                          cursorWidth: 3,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width * 0.15 - 16,
                          child: FloatingActionButton(
                            onPressed: () {
                              action() async {
                                fetchPost(message, args.user_two, args.con_id);
                                _controller.clear();
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                                setState(() {
                                  post2 = fetchPost2(con_ids, user_2);
                                });
                              }

                              action();
                              //_controller.clearComposing();
                              // _controller.dispose();
                            },
                            child: Icon(Icons.send),
                            backgroundColor: color2,
                            tooltip: 'Send message',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width * 0.15 - 16,
                          child: FloatingActionButton(
                            onPressed: () {
                              _upload(args.user_two, args.con_id);
                              setState(() {
                                post2 = fetchPost2(con_ids, user_2);
                              });
                            },
                            child: Icon(
                              Icons.attach_file,
                              color: color2,
                            ),
                            backgroundColor: color3,
                            tooltip: 'Attach file',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          for (int i = snapshot.data.transactions.length - 1; i >= 1; i--) {
            if (snapshot.data.transactions[i].message == "1") {
              if (snapshot.data.transactions[i].user_two == "1") {
                if (snapshot.data.transactions[i].is_image == "1") {
//                  Uint8List temp = base64Decode(
//                      snapshot.data.transactions[i].message_recent);
                  list.add(
                    GestureDetector(
                      onTap: () {
                        download_image(snapshot.data.transactions[i].id);
                      },
//                      child: Padding(
//                        padding: const EdgeInsets.only(
//                            left: 0, right: 0, top: 8, bottom: 8),
//                        child: Container(
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(10.0),
//                            border: Border.all(color: color2, width: 1),
//                            color: color3,
//                          ),
//                          width: width * 0.8 - 32,
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Image.memory(Base64Decoder().convert(
//                                snapshot.data.transactions[i].message_recent)),
//                          ),
//                        ),
//                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 8, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: color2, width: 1),
                            color: color3,
                          ),
                          width: width * 0.8 - 32,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: (width * 0.8 - 50) / 2,
                                  child: Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: color3,
                                        child: Icon(
                                          FontAwesomeIcons.image,
                                          color: color2,
                                          size: 40.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: (width * 0.8 - 50) / 2,
                                  child: Column(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Image File',
                                              style: text14.copyWith(
                                                color: color2,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '\nShow Image',
                                              style: text10.copyWith(
                                                  color: color6),
                                            ),
                                            TextSpan(
                                              text: '\n • ' +
                                                  snapshot.data.transactions[i]
                                                      .time +
                                                  ' ' +
                                                  snapshot.data.transactions[i]
                                                      .date,
                                              style: text13.copyWith(
                                                fontSize: 12,
                                                color: color2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), //your image//my image
                    ), //your image
                  );
                } else {
                  list.add(
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 8, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: color2, width: 1),
                          color: color3,
                        ),
                        width: width * 0.8 - 32,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: snapshot
                                      .data.transactions[i].message_recent,
                                  style: text13.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: '\n • ' +
                                      snapshot.data.transactions[i].time +
                                      ' ' +
                                      snapshot.data.transactions[i].date,
                                  style: text13.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
              if (snapshot.data.transactions[i].user_one == "1") {
                if (snapshot.data.transactions[i].is_image == "1") {
//                  Uint8List temp = base64Decode(
//                      snapshot.data.transactions[i].message_recent);
                  list.add(
                    GestureDetector(
                      onTap: () {
                        download_image(snapshot.data.transactions[i].id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 8, bottom: 8),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: width * 0.20,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: color2, width: 1),
                                    color: color2,
                                  ),
                                  width: width * 0.8 - 32,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: (width * 0.8 - 50) / 2,
                                          child: Column(
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 50.0,
                                                backgroundColor: color2,
                                                child: Icon(
                                                  FontAwesomeIcons.image,
                                                  color: color1,
                                                  size: 40.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (width * 0.8 - 50) / 2,
                                          child: Column(
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Image File',
                                                      style: text14.copyWith(
                                                        color: color1,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '\nShow Image',
                                                      style: text10.copyWith(
                                                          color: color6),
                                                    ),
                                                    TextSpan(
                                                      text: '\n • ' +
                                                          snapshot
                                                              .data
                                                              .transactions[i]
                                                              .time +
                                                          ' ' +
                                                          snapshot
                                                              .data
                                                              .transactions[i]
                                                              .date,
                                                      style: text13.copyWith(
                                                        fontSize: 12,
                                                        color: color1,
                                                      ),
                                                    ),
                                                  ],
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
                          ],
                        ),
                      ),
                    ), //my image
                  );
                } else {
                  list.add(
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 8, bottom: 8),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: width * 0.20,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: color2, width: 1),
                                  color: color2,
                                ),
                                width: width * 0.8 - 32,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: snapshot.data.transactions[i]
                                              .message_recent,
                                          style: text13.copyWith(
                                            fontSize: 15,
                                            color: color1,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n • ' +
                                              snapshot
                                                  .data.transactions[i].time +
                                              ' ' +
                                              snapshot
                                                  .data.transactions[i].date,
                                          style: text13.copyWith(
                                            fontSize: 12,
                                            color: color1,
                                          ),
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
                  );
                }
              }
              //admin msg

              if (snapshot.data.transactions[i].admin == "1") {
                list.add(
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 8, bottom: 8),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: color2, width: 0),
                                color: color5,
                              ),
                              width: width - 32,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Admin\n',
                                        style: text13.copyWith(
                                          fontSize: 15,
                                          color: color9,
                                        ),
                                      ),
                                      TextSpan(
                                        text: snapshot.data.transactions[i]
                                            .message_recent,
                                        style: text13.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '\n • ' +
                                            snapshot.data.transactions[i].time +
                                            ' ' +
                                            snapshot.data.transactions[i].date,
                                        style: text13.copyWith(
                                          fontSize: 12,
                                          color: color1,
                                        ),
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
                  ), //admin message
                );
              }
            }
          }

          if (snapshot.data.transactions[0].trade_status == "closed") {
            if (snapshot.data.transactions[0].buyer_email == email) {
              r_btc = false;
              c_btc = true;
              d_btc = true;
            }
            if (snapshot.data.transactions[0].seller_email == email) {
              c_btc = false;
              r_btc = true;
              d_btc = true;
            }
          } else {
            closed_btc = true;
            r_btc = false;
            c_btc = false;
            d_btc = false;
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
                  child: ChatCount(),
                ),
              ],
              iconTheme: IconThemeData(
                color: color4,
              ),
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                'Chat',
                style: text4,
              ),
            ),
            body: Container(
              child: SmartRefresher(
                enablePullDown: true,
                header: WaterDropHeader(),
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
                                  children: list),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //whitecard
                  ],
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
              ),
            ),

//
            bottomNavigationBar: Container(
              color: color1,
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: closed_btc,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // releasetrade(args.con_id);
//                            Navigator.pushNamed(context, SellCoinDashboard.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Chat Closed',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: d_btc,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _d_btc_confirmation(context, args.con_id);
                          // disputetrade(args.con_id);

//                            Navigator.pushNamed(context, BuyCoinDashboard.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Dispute',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: r_btc,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // releasetrade(args.con_id);
                          _r_btc_confirmation(context, args.con_id);
//                            Navigator.pushNamed(context, SellCoinDashboard.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Release',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: c_btc,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //canceltrade(args.con_id);
                          _c_btc_confirmation(context, args.con_id);
//                            Navigator.pushNamed(context, WalletSend.sid);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Cancel',
                                style: text4,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));

          // return Text(snapshot.data.id);
        } else if (snapshot.hasError) {
          /*   List<Widget> list = new List();
          list.add(Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Container(
              width: width - 32,
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Grabthesite',
                      style: text2.copyWith(
                        color: color4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),);
          list.add(Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: width * 0.7 - 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border:
                      Border.all(color: color2, width: 2),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        message=text;
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: text8.copyWith(
                          fontSize: 15,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: text7,
                      cursorColor: color2,
                      cursorWidth: 3,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width * 0.15 - 16,
                      child: FloatingActionButton(
                        onPressed: () {
                          fetchPost(message,args.user_two,args.con_id);
                        },
                        child: Icon(Icons.send),
                        backgroundColor: color2,
                        tooltip: 'Send message',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width * 0.15 - 16,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.attach_file,
                          color: color2,
                        ),
                        backgroundColor: color3,
                        tooltip: 'Attach file',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          );
          list.add(Center(child:Text("Sorry")));
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
                          Navigator.pushNamed(context, ChatHome.sid);
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.solidBell),
                      tooltip: 'Show Notifications',
                      onPressed: () {
                        Navigator.pushNamed(context, NotificationHome.sid);
                      },
                    ),
                  ],
                  iconTheme: IconThemeData(
                    color: color4,
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                  title: Text(
                    'Grabthesite',
                    style: text4,
                  ),
                ),
                body: Container(
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
                                  children: list
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
                bottomNavigationBar: Container(
                  color: color1,
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, BuyCoinDashboard.sid);
                          },
                          child: Container(
                            color: color1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sell',
                                  style: text4,
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
                            Navigator.pushNamed(context, SellCoinDashboard.sid);
                          },
                          child: Container(
                            color: color1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sell',
                                  style: text4,
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
                            Navigator.pushNamed(context, WalletSend.sid);
                          },
                          child: Container(
                            color: color1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Send',
                                  style: text4,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));*/

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
                    //  Navigator.pushNamed(context, ChatHome.sid);
                    Navigator.pop(context);
                  })
            ],
            title: "Release BTC",
            desc: "Release BTC Successful")
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
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Release BTC",
            desc: "Release BTC failed due to incorrect OTP")
        .show();
  }

  _onBasicAlertPressed3(context, String con_id) {
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
                    setState(() {
                      post2 = fetchPost2(con_id, user_2);
                    });
                    //Navigator.pop(context);
                    Navigator.pop(context);
                    //Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Dispute",
            desc: "Dispute Successful")
        .show();
  }

  _onBasicAlertPressed4(context, String con_id) {
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
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                    setState(() {
                      post2 = fetchPost2(con_id, user_2);
                      Navigator.pop(context);
                    });
                  })
            ],
            title: "Disputr",
            desc: "Release BTC failed due to insufficient balance")
        .show();
  }

  String otp;

  _r_btc_confirmation(context, String con_id) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    send_otp();
                    Navigator.pop(context);
                    Alert(
                            context: context,
                            content: TextField(
                              onChanged: (text) {
                                otp = text;
                              },
                              decoration:
                                  InputDecoration(hintText: "Enter the otp"),
                            ),
                            buttons: [
                              DialogButton(
                                color: color2,
                                child: Text(
                                  'Release',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  verify_otp(otp, con_id);
                                  Navigator.pop(context);
                                },
                              )
                            ],
                            title: "Release BTC",
                            desc: "Please Enter the OTP")
                        .show();
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  }),
              DialogButton(
                  color: color2,
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context); // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Release BTC",
            desc: "Are You Sure You Want to release BTC?")
        .show();
  }

  _c_btc_confirmation(context, String con_id) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    canceltrade(
                        con_id); // Navigator.pushNamed(context, ChatIndividual.sid);
                  }),
              DialogButton(
                  color: color2,
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Cancel BTC",
            desc: "Are You Sure You Want to Cancel?")
        .show();
  }

  _d_btc_confirmation(context, String con_id) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    disputetrade(con_id);
                    // canceltrade(con_id);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  }),
              DialogButton(
                  color: color2,
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // disputetrade(con_id);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Dispute BTC",
            desc: "Are You Sure You Want to Dispute?")
        .show();
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
                    setState(() {
                      post2 = fetchPost2(con_ids, user_2);
                    });
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Cancel Trade",
            desc: "Cancel Trade Successful")
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
                    //  Navigator.pushNamed(context, ChatIndividual.sid);
                  })
            ],
            title: "Release BTC",
            desc: "Release BTC failed due to insufficient balance")
        .show();
  }

  Future<void> releasetrade(String con_id) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/trade_confirm.php?key=anu5781&con_uid=' +
            con_id);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        setState(() {
          post2 = fetchPost2(con_ids, user_2);
        });
        return _onBasicAlertPressed(context);
      } else {}
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<void> canceltrade(String con_id) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/trade_cancelled.php?key=anu5781&con_uid=' +
            con_id +
            'email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));
      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return _onBasicAlertPressed5(context);
      } else {
        return _onBasicAlertPressed6(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<void> disputetrade(String con_id) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/trade_dispute.php?key=anu5781&con_uid=' +
            con_id);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return _onBasicAlertPressed3(context, con_id);
      } else {
        return _onBasicAlertPressed4(context, con_id);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void verify_otp(String otp, String con_id) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/verify_otp.php?key=anu5781&otp=' +
            otp +
            '&email=' +
            email);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        return releasetrade(con_id);
      } else {
        return _onBasicAlertPressed2(context);
        // return _onBasicAlertPressed4(context, con_id);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void send_otp() async {
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

  void download_image(String message_id) async {
    String url = 'https://asianbitcoins.org/images/getimage.php?message_id=' +
        message_id +
        '&email=' +
        email;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
