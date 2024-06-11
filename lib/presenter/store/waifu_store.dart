import 'package:exempla_change_notifier/domain/entities/waifu.dart';
import 'package:exempla_change_notifier/infra/httpConnection/http_service.dart';
import 'package:flutter/material.dart';


enum WaifuState { INIT,LOADING, SUCCESS, FAILURE }

class WaifuStore extends ChangeNotifier {

  final HttpService _httpService = HttpService();
  WaifuState _state = WaifuState.INIT;
  Waifu _waifu = Waifu(url: 'init');
  WaifuState get state => _state;
  Waifu get waifu => _waifu;

  void setWaifu(Waifu waifu){
    _waifu = waifu;
    notifyListeners();
  }

  void setState(WaifuState state){
    _state = state;
    notifyListeners();
  }

  Future<Waifu> getWaifu() async{
    setState(WaifuState.LOADING);
    try{
      final Waifu waifu = await _httpService.getWaifu();
      setWaifu(waifu);
      setState(WaifuState.SUCCESS);
      return waifu;
    }catch(err){
      setState(WaifuState.FAILURE);
      rethrow;
    }
  }
 


}



