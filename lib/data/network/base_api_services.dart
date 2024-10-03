//this is only abstract clas in it we define function nd properties nd use it in class which extend it
abstract class BaseApiServices {
  //these tow functions for get nd post api
  Future<dynamic> getApi(String url);
  //data required for  post and put for get nd delete data not require
  Future<dynamic> postApi(String url, var  data);
  Future<dynamic> deleteApi(String url);
}