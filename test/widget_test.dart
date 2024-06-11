// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exempla_change_notifier/domain/entities/waifu.dart';
import 'package:exempla_change_notifier/infra/httpConnection/request_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exempla_change_notifier/main.dart';

void main() {
  


  group('TODOS MEUS TESTES', (){
    final RequestFactory requestFactory = RequestFactory();

    
    
    test('Test for request factory', ()async{
      try{
        final response = await requestFactory.getWaifu();
        print(response.data);
        expect(response.statusCode, 200);
      }catch(err){
        print(err);
        expect(err, isException);
      }    
    });

    test('Test for Service', ()async{
    try{
      final response = await requestFactory.getWaifu();
      final waifu = Waifu.fromJson(response.data);
      print(waifu.url);
      expect(waifu.url, isNotNull);
    }catch(err){
      print(err);
      expect(err, isException);
    }
    
    });
  });


}
