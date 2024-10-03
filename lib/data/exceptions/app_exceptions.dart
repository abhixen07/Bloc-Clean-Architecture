//this class only implement exception this is base class
class AppException implements Exception {
  //exception  has message
  final _message; //show message something went wrong
  final _prefix; //show error  which error is
  AppException([this._message, this._prefix]);

  //this method converts the exception to a string.
  String toString() {
    return '$_prefix $_message';
  }
}

//mention all exception here which occurs in app nd which type
//this occur when network error or any other error occur during fetching time out eror etc
//in super defined initial value
//message is from user
//initial value is also empty  string
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

// url not exist then invalid or bad request not exist at server
class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
      : super(message, 'Request Time Out');
}

// url not exist then invalid or bad request not exist at server
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

//token validation login sign up response token that user have access if not validate then error
class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'Unauthorized Access');
}

//invalid input we enter
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal Server Error:');
}