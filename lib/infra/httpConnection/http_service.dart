import 'package:exempla_change_notifier/domain/entities/waifu.dart';
import 'package:exempla_change_notifier/domain/useCase/waifu_use_case.dart';
import 'package:exempla_change_notifier/infra/httpConnection/request_factory.dart';

class HttpService implements WaifuUseCase{

  final RequestFactory requestFactory = RequestFactory();

  @override
  Future<Waifu> getWaifu() async{
    try{
      final response = await requestFactory.getWaifu();
      final waifu = Waifu.fromJson(response.data);
      return waifu;
    }catch(err){
      rethrow;
    }
    
  }

}