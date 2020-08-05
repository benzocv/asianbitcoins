import 'dart:io';
//import 'package:bitether_club/appTheme.dart';
//import 'package:best_flutter_ui_templates/user_management/login_screen_2.dart';
//import 'package:best_flutter_ui_templates/user_management/login_screen_2.dart';
//import 'package:bitether_club/user_management/login_screen_2.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:best_flutter_ui_templates/user_management/login_screen_1.dart';
//import 'package:bitether_club/dashboard.dart';

class LoginCredentials {
  String email;
  String password;

  LoginCredentials(this.email, this.password);
}

class CoinDaashboardData {
  String username;
  String id;
  String my_id;

  CoinDaashboardData(this.username, this.id, this.my_id);
}

class refrall {
  String name;
  String id;

  refrall(this.name, this.id);
}

class buy_trade_explore_data {
  String user_one;
  String user_two;
  String trade_uid;
  String trade_amount;
  String type;
  String price_per_btc;

  buy_trade_explore_data(this.user_one, this.user_two, this.trade_uid,
      this.trade_amount, this.type, this.price_per_btc);
}

class chat_home_data {
  String user_two;
  String con_id;

  chat_home_data(this.user_two, this.con_id);
}

class twofactor {
  String email;
  String otp;

  twofactor(this.email, this.otp);
}

class Signups1Credentials {
  String email;
  String name;
  String pass;

  Signups1Credentials(this.name, this.pass, this.email);
}

class SignupCredentials {
  String email;
  String name;
  String mobile;
  String pass;
  String address;
  String district;
  String state;

  SignupCredentials(this.name, this.mobile, this.email, this.pass, this.address,
      this.district, this.state);
}

class profileinfo1_data {
  String firstname;
  String lastname;
  String email;

  profileinfo1_data(this.firstname, this.lastname, this.email);
}

class walletsend_data {
  String bitcoin_address;
  String email_address;
  String value;
  String amount;
  String comments;
  walletsend_data(
      this.bitcoin_address, this.email_address, this.amount, this.comments);
}

class profileinfo2_data {
  String firstname;
  String lastname;
  String email;
  String countrycode;
  String residencecountry;
  String phone;
  EstimatedTrade tradevol;
  Currency currency_ex;

  profileinfo2_data(this.firstname, this.lastname, this.email, this.countrycode,
      this.residencecountry, this.phone, this.tradevol, this.currency_ex);
}

class profileinfo3_data {
  String firstname;
  String lastname;
  String email;
  String countrycode;
  String residencecountry;
  String phone;
  EstimatedTrade tradevol;
  String politically_exposed;
  profileinfo3_data(
      this.firstname,
      this.lastname,
      this.email,
      this.countrycode,
      this.residencecountry,
      this.phone,
      this.tradevol,
      this.politically_exposed);
}

class phone_verification_data {
  String firstname;
  String lastname;
  String email;
  String countrycode;
  String residencecountry;
  String phone;
  EstimatedTrade tradevol;
  String politically_exposed;
  String otp;
  //String sender;
  phone_verification_data(
      this.firstname,
      this.lastname,
      this.email,
      this.countrycode,
      this.residencecountry,
      this.phone,
      this.tradevol,
      this.politically_exposed,
      this.otp);
}

class buycoin_page_one_data {
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  buycoin_page_one_data(this.location, this.paymethod, this.currency_ex);
}

class buycoin_page_two_data {
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  buycoin_page_two_data(this.location, this.paymethod, this.currency_ex,
      this.margin_ex, this.bankname);
}

class buycoin_page_three_data {
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;
  buycoin_page_three_data(
      this.location,
      this.paymethod,
      this.currency_ex,
      this.margin_ex,
      this.bankname,
      this.min_t_limit_,
      this.max_t_limit,
      this.terms_of_trade);
}

class buycoin_page_four_data {
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;
  Hour suns_f;
  Hour sune_f;
  Hour mons_f;
  Hour mone_f;
  Hour tues_f;
  Hour tuee_f;
  Hour weds_f;
  Hour wede_f;
  Hour thus_f;
  Hour thue_f;
  Hour fris_f;
  Hour frie_f;
  Hour sats_f;
  Hour sate_f;

  buycoin_page_four_data(
      this.location,
      this.paymethod,
      this.currency_ex,
      this.margin_ex,
      this.bankname,
      this.min_t_limit_,
      this.max_t_limit,
      this.terms_of_trade,
      this.suns_f,
      this.sune_f,
      this.mons_f,
      this.mone_f,
      this.tues_f,
      this.tuee_f,
      this.weds_f,
      this.wede_f,
      this.thus_f,
      this.thue_f,
      this.fris_f,
      this.frie_f,
      this.sats_f,
      this.sate_f);
}

class buycoin_page_five_data {
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;

  String pay_window;
  String identified_people;
  String sms_verification_required;
  String trusted_people;

  buycoin_page_five_data(
      this.location,
      this.paymethod,
      this.currency_ex,
      this.margin_ex,
      this.bankname,
      this.min_t_limit_,
      this.max_t_limit,
      this.terms_of_trade,
      this.pay_window,
      this.identified_people,
      this.sms_verification_required,
      this.trusted_people);
}

class sellcoin_page_five_data {
  CountryCode location;
  PaymentMethod paymethod;
  Currency currency_ex;
  String bankname;
  String margin_ex;
  String min_t_limit_;
  String max_t_limit;
  String terms_of_trade;
  Hour suns_f;
  Hour sune_f;
  Hour mons_f;
  Hour mone_f;
  Hour tues_f;
  Hour tuee_f;
  Hour weds_f;
  Hour wede_f;
  Hour thus_f;
  Hour thue_f;
  Hour fris_f;
  Hour frie_f;
  Hour sats_f;
  Hour sate_f;

  String pay_window;
  String identified_people;
  String sms_verification_required;
  String trusted_people;
  String pay_details;
  String min_vol;
  String new_buyer_limit;

  sellcoin_page_five_data(
      this.location,
      this.paymethod,
      this.currency_ex,
      this.margin_ex,
      this.bankname,
      this.min_t_limit_,
      this.max_t_limit,
      this.terms_of_trade,
      this.pay_details,
      this.min_vol,
      this.new_buyer_limit);
}
