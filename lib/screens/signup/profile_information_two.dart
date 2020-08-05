import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/screens/signup/profile_information_three.dart';
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost(String firstname, String email, String lastname) async {
  // BuildContext context;

  final response = await http.get(
      'https://asianbitcoins.org/abc/api/updateprofile.php?email=' +
          email +
          '&fname=' +
          firstname +
          '&key=anu5781' +
          '&lname=' +
          lastname +
          '&step_one=true');
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

class ProfileInformationTwo extends StatefulWidget {
  static const sid = 'profile_information_two';

  @override
  _ProfileInformationTwoState createState() => _ProfileInformationTwoState();
}

class _ProfileInformationTwoState extends State<ProfileInformationTwo> {
  String countrycode;
  String phone;
  String residencecountry;
  EstimatedTrade tradevol;
  // String tradevol2;
  String firstname = '';
  String lastname = '';
  String email = '';
  String selected_country = '';
  Future<Post> post;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profileinfo1_data args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    firstname = args.firstname;
    lastname = args.lastname;
    //  String email='anusa@gmail.com';
    //  String pass='anu5781';
    post = fetchPost(firstname, email, lastname);
  }

  Currency currency_ex;

  String value;
  double lastcontainerheight;
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    final profileinfo1_data args = ModalRoute.of(context).settings.arguments;
    email = args.email;
    firstname = args.firstname;
    lastname = args.lastname;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 520 - 70 - 85;
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: color3,
                                child: Text(
                                  '2',
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

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: color2, width: 2),
                        ),
                        child: DropdownButtonFormField<CountryCode>(
                          icon: Icon(
                            FontAwesomeIcons.angleDown,
                            color: color2,
                          ),
                          style: text7,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, right: 5),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          hint: Text(
                            "+91 India",
                            style: text8,
                          ),
                          value: selectedCountry,
                          onChanged: (CountryCode Value) {
                            setState(() {
                              selectedCountry = Value;
                              //  selected_country=Value;
                            });
                          },
                          onSaved: (val) => setState(
                              () => countrycode = selectedCountry.code),
                          items: country.map(
                            (CountryCode country) {
                              return DropdownMenuItem<CountryCode>(
                                value: country,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          country.code,
                                          style: text7.copyWith(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          country.name,
                                          style: text7.copyWith(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ), //country dropdown
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 0,
                      ),
                      child: Text(
                        'Choose a country code ',
                        style: text11,
                      ),
                    ), //country code dropdown helping text
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Container(
                        width: width - 32,
                        child: Text(
                          'Phone Number',
                          style: text4,
                        ),
                      ),
                    ), //Phone number label
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: TextFormField(
                        onChanged: (text) {
                          value = text;
                          print(value);
                        },
                        onSaved: (val) => setState(() => phone = val),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: text8,
                          helperText:
                              'Your phone number without leading zeros.',
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
                          left: 16, right: 16, bottom: 5, top: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: color2, width: 2),
                        ),
                        child: DropdownButtonFormField<CountryCode>(
                          icon: Icon(
                            FontAwesomeIcons.angleDown,
                            color: color2,
                          ),
                          style: text7,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, right: 5),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          hint: Text(
                            "Country of residence",
                            style: text8,
                          ),
                          value: selectedCountry,
                          onChanged: (CountryCode Value) {
                            setState(() {
                              selectedCountry = Value;
                            });
                          },
                          onSaved: (val) => setState(
                              () => residencecountry = selectedCountry.name),
                          items: country.map(
                            (CountryCode country) {
                              return DropdownMenuItem<CountryCode>(
                                value: country,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          country.name,
                                          style: text7.copyWith(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ), //country citizenship dropdown
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 0,
                      ),
                      child: Text(
                        'Country of residence',
                        style: text11,
                      ),
                    ), //country citizenship dropdown helping text

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 5, top: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: color2, width: 2),
                        ),
                        child: DropdownButtonFormField<EstimatedTrade>(
                          icon: Icon(
                            FontAwesomeIcons.angleDown,
                            color: color2,
                          ),
                          style: text7,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, right: 5),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          hint: Text(
                            "Trade Volume",
                            style: text8,
                          ),
                          value: selectedEstimatedTrade,
                          onChanged: (EstimatedTrade Value) {
                            setState(() {
                              selectedEstimatedTrade = Value;
                            });
                          },
                          onSaved: (val) =>
                              setState(() => tradevol = selectedEstimatedTrade),
                          items: estimatedTradeList.map(
                            (EstimatedTrade estimatedTradeList) {
                              return DropdownMenuItem<EstimatedTrade>(
                                value: estimatedTradeList,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          estimatedTradeList.limit1 +
                                              '-' +
                                              estimatedTradeList.limit2,
                                          style: text7.copyWith(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ), //trade volume dropdown
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 0,
                      ),
                      child: Text(
                        'Please specify your estimated trade volume in euros for the next 12 monts.',
                        style: text11,
                        maxLines: 5,
                      ),
                    ), //trade volume dropdown helping text

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 5, top: 32),
                      child: Container(
                        width: width - 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: color2, width: 2),
                        ),
                        child: DropdownButtonFormField<Currency>(
                          icon: Icon(
                            FontAwesomeIcons.angleDown,
                            color: color2,
                          ),
                          style: text7,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, right: 5),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          hint: Text(
                            "Currency",
                            style: text8,
                          ),
                          value: selectedcurrecny,
                          onChanged: (Currency Value) {
                            setState(() {
                              selectedcurrecny = Value;
                              currency_ex = Value;
                            });
                          },
                          items: currency.map(
                            (Currency currency) {
                              return DropdownMenuItem<Currency>(
                                value: currency,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          currency.currency,
                                          style: text7.copyWith(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
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
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: color1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            Navigator.pushNamed(
                                context, ProfileInformationThree.sid,
                                arguments: profileinfo2_data(
                                    firstname,
                                    lastname,
                                    email,
                                    countrycode,
                                    residencecountry,
                                    phone,
                                    tradevol,
                                    currency_ex));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            )));
  }
}
