//T is basically data we pass class T it could be anything in T we just have data
import 'package:bloc_clean_coding/utils/enums.dart';

class ApiResponse<T>{

  Status? status;
  T? data;   //dynamic function which  take data
  String? message;
  ApiResponse(this.status,this.data,this.message);

  //colon : means it used the super method for status
  ApiResponse.loading() :status = Status.LOADING;

  ApiResponse.completed(this.data): status = Status.COMPLETED;

  ApiResponse.error(this.message):status = Status.ERROR;

//override method means we  override it to utilize it
  @override
  String toString(){
    return "Status: $status \n Message : $message \n Data : $data";
  }
}