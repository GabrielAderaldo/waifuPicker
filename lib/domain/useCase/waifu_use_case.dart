import 'package:exempla_change_notifier/domain/entities/waifu.dart';

abstract class WaifuUseCase{
  Future<Waifu> getWaifu();
}