import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_constants/base_url_constant.dart';
import 'package:kisan_dost_app/kisan_models/dummytest.dart';
import 'package:kisan_dost_app/kisan_models/otp_validation_response.dart';
import 'package:kisan_dost_app/kisan_models/otp_ver_model.dart';
import 'package:kisan_dost_app/kisan_models/signup_model.dart';

import 'package:http/http.dart' as http;

class UserService {
  var client = http.Client();

  Future<String> generateOtp(OtpVerModel otpVerDetails) async {
    print('otp service');
    try {
      var response = await client.post(
        Uri.parse(ApplicationConstants.baseUrl + "/user/otp"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(otpVerDetails.toJson()),
      );

      if (response != null) {
        if (response.statusCode == 200) {
          print("OTP call success, response " + response.body);
          return response.statusCode.toString();
        } else {
          return response.statusCode.toString();
        }
      } else {
        return "null";
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
    return "";
  }

  Future<String> validateOtp(OtpVerModel userOtpDetails) async {
    try {
      var response = await client.post(
        Uri.parse(ApplicationConstants.baseUrl + "/user/otp/verify"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userOtpDetails.toJsonOtpResponse()),
      );
      if (response.statusCode == 200) {
        print("OTP verified successfully, " + response.body);
       // return UserResponseModel.fromJson(jsonDecode(response.body)).toString();
      } else {
        return "null";
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
    return "";
  }

  Future<String> signUp(SignupModel userDetails) async {
    print('sign up here');
    print("user details ${userDetails.toJsoncheck()}");
    print("dummy details ${DummyTest().toJson()}");
    try {
      var response = await client.post(
        Uri.parse(ApplicationConstants.baseUrl + "/user"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{

        }),
      );
      print("response " + response.body);
      if (response.statusCode == 201) {
     //   return UserResponseModel.fromJson(jsonDecode(response.body)).toString();
      } else {
        return "null";
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
    return "";
  }

}
