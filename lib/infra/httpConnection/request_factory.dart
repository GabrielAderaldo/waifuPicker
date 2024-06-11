import 'package:dio/dio.dart';

class RequestFactory{
  final dio = Dio();

  Future<Response> getWaifu() async{
   try{
     return await dio.get('https://api.waifu.pics/sfw/waifu');
   }catch(err){
     rethrow;
   }
  }



}