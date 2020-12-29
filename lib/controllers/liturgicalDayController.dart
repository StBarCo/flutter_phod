import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_phod/stores/helpers.dart';

class LiturgicalDayController extends GetxController {
  Rx<LiturgicalDay> _day = Rx<LiturgicalDay>();

  LiturgicalDay get day => _day.value;

  LiturgicalDay init({String thisService, DateTime now}) {
    _day.value = LiturgicalDay().init(service: thisService, now: now);
    return _day.value;
  }

}