import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_coding/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_coding/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class NetworkApiServices implements BaseApiServices {
  //url is basically api url

  @override
  Future<dynamic> getApi(String url) async {
    //variable for response saving
    dynamic responseJson;
    try {
      //if we do not do this then this process repeat in every class
      //when we hit api
      final response =
      await http.get(Uri.parse(url)).timeout( Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //socket exception in no internet exception
      throw NoInternetException('');
    } on TimeoutException{
      throw FetchDataException('Time Out Try Again');
    }
    return responseJson;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic responseJson;
    try {

      final response =
      await http.get(Uri.parse(url)).timeout( Duration(seconds: 50));
      responseJson = returnResponse(response);
    } on SocketException {

      throw NoInternetException('');
    } on TimeoutException{
      throw FetchDataException('Time Out Try Again');
    }
    return responseJson;
  }

//this function handle all get api request
  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //socket exception in no internet exception
      throw NoInternetException('');
    } on TimeoutException{
      throw FetchDataException('Time Out Try Again');
    }
    return responseJson;
  }
//api code here not replicate same code in differ classes
//this function we write for solid principle and it handle response nd give exception according to it
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
    //total 500 status code
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAuthorizedException();
      case 500:
        throw FetchDataException(
            'Error Occurred while communicated with server' +
                'with status code' +
                response.statusCode.toString());
      default:
        throw FetchDataException();
    }
  }
}

