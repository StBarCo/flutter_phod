import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phod/controllers/psalmController.dart';
import 'package:flutter_phod/models/calendar_day.dart';
import 'package:flutter_phod/models/psalm_model.dart';
import 'package:get/get.dart';
import 'package:flutter_phod/models/liturgical_day.dart';
import 'package:flutter_phod/controllers/configController.dart';

ConfigController cc = Get.put( ConfigController() );
PsalmController psc = Get.put( PsalmController() );

class PsalmsDB {
  final CollectionReference psalmsCollection = FirebaseFirestore.instance.collection('psalms');

  getDailyPsalms( CalendarDayModel selectedDay, String selectedService) {
    LiturgicalDay litDay = selectedDay.litDay;
    Map map = (cc.psalmCycle == '60DayCycle') ? map60Day : map30Day;
    Map innerMap = map[litDay.season.id];
    innerMap ??= map[litDay.now.day.toString()];
    List<Ps> pss = innerMap[selectedService];
    getListOfPsalms(pss);
  }


  getListOfPsalms( List<Ps> pss) {
    List<String> pKeys = pss.map( (p) => 'acna${p.ps}').toList();
    var resp = Future.wait( pKeys.map( (k) => psalmsCollection.doc(k).get()));
    int i = 0;
    resp.then( (snapshots) {
      psc.clearPsalms; // clear out the old psalms only after getting the new
      snapshots.forEach( (snapshot) {
        psc.appendPsalm(PsalmModel.fromDocumentSnapshot(pss[i++], snapshot));
      });
    })
    .catchError( (err) => print("!!!!! Error getting psalms: $err"));
  }

  Future getPsalmByName(Ps ps ) {
    Future resp =  psalmsCollection.doc("acna${ps.ps}").get();
    resp
    .then( (snapshot) {
      psc.clearPsalms;
      psc.appendPsalm( PsalmModel.fromDocumentSnapshot(ps, snapshot));
      } )
    .catchError( (err) => print("!!!!! Error getting single psalm: $err"));
  }


  static Map<String, Map> map30Day = {
    'holyWeek4': {
      'mp': [Ps(41, 1, 999)],
      'ep': [Ps(142, 1, 999), Ps(143, 1, 999)]
    }
    ,
    'holyWeek5': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(102, 1, 999)]}
    ,
    'holyWeek6': { 'mp': [Ps(88, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    'easter1': {
      'mp': [Ps(118, 1, 999)],
      'ep': [Ps(111, 1, 999), Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    'ascension': {
      'mp': [Ps(8, 1, 999), Ps(47, 1, 999)],
      'ep': [Ps(21, 1, 999), Ps(24, 1, 999)]
    }
    ,
    'pentecost': { 'mp': [Ps(48, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '1': {
      'mp': [
        Ps(1, 1, 999),
        Ps(2, 1, 999),
        Ps(3, 1, 999),
        Ps(4, 1, 999),
        Ps(5, 1, 999)
      ]
      ,
      'ep': [Ps(6, 1, 999), Ps(7, 1, 999), Ps(8, 1, 999)]
    }
    // 1
    ,
    '2': { 'mp': [Ps(9, 1, 999), Ps(10, 1, 999), Ps(11, 1, 999)]
      , 'ep': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)]}
    // 2
    ,
    '3': { 'mp': [Ps(15, 1, 999), Ps(16, 1, 999), Ps(17, 1, 999)]
      , 'ep': [Ps(18, 1, 999)]}
    // 3
    ,
    '4': { 'mp': [Ps(19, 1, 999), Ps(20, 1, 999), Ps(21, 1, 999)]
      , 'ep': [Ps(22, 1, 999), Ps(23, 1, 999)]}
    // 4
    ,
    '5': { 'mp': [Ps(24, 1, 999), Ps(25, 1, 999), Ps(26, 1, 999)]
      , 'ep': [Ps(27, 1, 999), Ps(28, 1, 999), Ps(29, 1, 999)]}
    // 5
    ,
    '6': { 'mp': [Ps(30, 1, 999), Ps(31, 1, 999)]
      , 'ep': [Ps(32, 1, 999), Ps(33, 1, 999), Ps(34, 1, 999)]}
    // 6
    ,
    '7': { 'mp': [Ps(35, 1, 999), Ps(36, 1, 999)]
      , 'ep': [Ps(37, 1, 999)]}
    // 7
    ,
    '8': { 'mp': [Ps(38, 1, 999), Ps(39, 1, 999), Ps(40, 1, 999)]
      , 'ep': [Ps(41, 1, 999), Ps(42, 1, 999), Ps(43, 1, 999)]}
    // 8
    ,
    '9': { 'mp': [Ps(44, 1, 999), Ps(45, 1, 999), Ps(46, 1, 999)]
      , 'ep': [Ps(47, 1, 999), Ps(48, 1, 999), Ps(49, 1, 999)]}
    // 9
    ,
    '10': { 'mp': [Ps(50, 1, 999), Ps(51, 1, 999), Ps(52, 1, 999)]
      , 'ep': [Ps(53, 1, 999), Ps(54, 1, 999), Ps(55, 1, 999)]}
    // 10
    ,
    '11': { 'mp': [Ps(56, 1, 999), Ps(57, 1, 999), Ps(58, 1, 999)]
      , 'ep': [Ps(59, 1, 999), Ps(60, 1, 999), Ps(61, 1, 999)]}
    // 11
    ,
    '12': { 'mp': [Ps(62, 1, 999), Ps(63, 1, 999), Ps(64, 1, 999)]
      , 'ep': [Ps(65, 1, 999), Ps(66, 1, 999), Ps(67, 1, 999)]}
    // 12
    ,
    '13': { 'mp': [Ps(68, 1, 999)]
      , 'ep': [Ps(69, 1, 999), Ps(70, 1, 999)]}
    // 13
    ,
    '14': { 'mp': [Ps(71, 1, 999), Ps(72, 1, 999)]
      , 'ep': [Ps(73, 1, 999), Ps(74, 1, 999)]}
    // 14
    ,
    '15': { 'mp': [Ps(75, 1, 999), Ps(76, 1, 999), Ps(77, 1, 999)]
      , 'ep': [Ps(78, 1, 999)]}
    // 15
    ,
    '16': {
      'mp': [Ps(79, 1, 999), Ps(80, 1, 999), Ps(81, 1, 999)]
      ,
      'ep':
      [Ps(82, 1, 999), Ps(83, 1, 999), Ps(84, 1, 999), Ps(85, 1, 999)]
    }
    // 16
    ,
    '17': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999), Ps(88, 1, 999)]
      , 'ep': [Ps(89, 1, 999)]}
    // 17
    ,
    '18': { 'mp': [Ps(90, 1, 999), Ps(91, 1, 999), Ps(92, 1, 999)]
      , 'ep': [Ps(93, 1, 999), Ps(94, 1, 999)]}
    // 18
    ,
    '19': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999), Ps(97, 1, 999)]
      ,
      'ep':
      [Ps(98, 1, 999), Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)]
    }
    // 19
    ,
    '20': { 'mp': [Ps(102, 1, 999), Ps(103, 1, 999)]
      , 'ep': [Ps(104, 1, 999)]}
    // 20
    ,
    '21': { 'mp': [Ps(105, 1, 999)]
      , 'ep': [Ps(106, 1, 999)]}
    // 21
    ,
    '22': { 'mp': [Ps(107, 1, 999)]
      , 'ep': [Ps(108, 1, 999), Ps(109, 1, 999)]}
    // 22
    ,
    '23': {
      'mp':
      [Ps(110, 1, 999), Ps(111, 1, 999), Ps(112, 1, 999), Ps(113, 1, 999)]
      ,
      'ep': [Ps(114, 1, 999), Ps(115, 1, 999)]
    }
    // 23
    ,
    '24': { 'mp': [Ps(116, 1, 999), Ps(117, 1, 999), Ps(118, 1, 999)]
      , 'ep': [Ps(119, 1, 32)]}
    // 24
    ,
    '25': { 'mp': [Ps(119, 33, 72)]
      , 'ep': [Ps(119, 73, 104)]}
    // 25
    ,
    '26': { 'mp': [Ps(119, 105, 144)]
      , 'ep': [Ps(119, 145, 176)]}
    // 26
    ,
    '27': {
      'mp': [
        Ps(120, 1, 999),
        Ps(121, 1, 999),
        Ps(122, 1, 999),
        Ps(123, 1, 999),
        Ps(124, 1, 999),
        Ps(125, 1, 999)
      ]
      ,
      'ep': [
        Ps(126, 1, 999),
        Ps(127, 1, 999),
        Ps(128, 1, 999),
        Ps(129, 1, 999),
        Ps(130, 1, 999),
        Ps(131, 1, 999)
      ]
    }
    // 27
    ,
    '28': {
      'mp':
      [Ps(132, 1, 999), Ps(133, 1, 999), Ps(134, 1, 999), Ps(135, 1, 999)]
      ,
      'ep': [Ps(136, 1, 999), Ps(137, 1, 999), Ps(138, 1, 999)]
    }
    // 28
    ,
    '29': { 'mp': [Ps(139, 1, 999), Ps(140, 1, 999)]
      , 'ep': [Ps(141, 1, 999), Ps(142, 1, 999), Ps(143, 1, 999)]}
    // 29
    ,
    '30': {
      'mp': [Ps(144, 1, 999), Ps(145, 1, 999), Ps(146, 1, 999)]
      ,
      'ep':
      [Ps(147, 1, 999), Ps(148, 1, 999), Ps(149, 1, 999), Ps(150, 1, 999)]
    }
    // 30
    ,
    '31': {
      'mp': [
        Ps(120, 1, 999),
        Ps(121, 1, 999),
        Ps(122, 1, 999),
        Ps(123, 1, 999),
        Ps(124, 1, 999),
        Ps(125, 1, 999),
        Ps(126, 1, 999),
        Ps(127, 1, 999)
      ]
      ,
      'ep': [
        Ps(127, 1, 999),
        Ps(128, 1, 999),
        Ps(129, 1, 999),
        Ps(130, 1, 999),
        Ps(131, 1, 999),
        Ps(132, 1, 999),
        Ps(133, 1, 999),
        Ps(134, 1, 999)
      ]
    }
    // 31
  };

  static Map<String, Map> map60Day = {
    'maundy_thursday': {
      'mp': [Ps(41, 1, 999)],
      'ep': [Ps(142, 1, 999), Ps(143, 1, 999)]
    }
    ,
    'good_friday': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(102, 1, 999)]}
    ,
    'holy_saturday': { 'mp': [Ps(88, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    'easter_day': {
      'mp': [Ps(118, 1, 999)],
      'ep': [Ps(111, 1, 999), Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    'ascension': {
      'mp': [Ps(8, 1, 999), Ps(47, 1, 999)],
      'ep': [Ps(21, 1, 999), Ps(24, 1, 999)]
    }
    ,
    'pentecost': { 'mp': [Ps(48, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '307': { 'mp': [Ps(1, 1, 999), Ps(2, 1, 999)], 'ep': [Ps(3, 1, 999), Ps(4, 1, 999)]}
    ,
    '308': { 'mp': [Ps(5, 1, 999), Ps(6, 1, 999)], 'ep':  [Ps(7, 1, 999)]}
    ,
    '309': { 'mp': [Ps(9, 1, 999)], 'ep':  [Ps(10, 1, 999)]}
    ,
    '310': {
      'mp': [Ps(8, 1, 999), Ps(11, 1, 999)],
      'ep':  [Ps(15, 1, 999), Ps(16, 1, 999)]
    }
    ,
    '311': {
      'mp': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)],
      'ep':  [Ps(17, 1, 999)]
    }
    ,
    '312': {
      'mp': [Ps(96, 1, 999), Ps(97, 1, 999)],
      'ep':  [Ps(67, 1, 999), Ps(72, 1, 999)]
    }
    ,
    '313': { 'mp': [Ps(18, 1, 20)], 'ep':  [Ps(18, 21, 52)]}
    ,
    '314': { 'mp': [Ps(19, 1, 999)], 'ep': [Ps(20, 1, 999), Ps(21, 1, 999)]}
    ,
    '315': { 'mp': [Ps(22, 1, 999)], 'ep': [Ps(23, 1, 999), Ps(24, 1, 999)]}
    ,
    '316': { 'mp': [Ps(25, 1, 999)], 'ep': [Ps(27, 1, 999)]}
    ,
    '317': { 'mp': [Ps(26, 1, 999), Ps(28, 1, 999)], 'ep': [Ps(31, 1, 999)]}
    ,
    '318': { 'mp': [Ps(29, 1, 999), Ps(30, 1, 999)], 'ep': [Ps(33, 1, 999)]}
    ,
    '319': { 'mp': [Ps(34, 1, 999)], 'ep': [Ps(35, 1, 999)]}
    ,
    '320': { 'mp': [Ps(32, 1, 999), Ps(36, 1, 999)], 'ep': [Ps(38, 1, 999)]}
    ,
    '321': { 'mp': [Ps(37, 1, 17)], 'ep': [Ps(37, 18, 41)]}
    ,
    '322': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(39, 1, 999), Ps(41, 1, 999)]}
    ,
    '323': { 'mp': [Ps(42, 1, 999), Ps(43, 1, 999)], 'ep': [Ps(44, 1, 999)]}
    ,
    '324': { 'mp': [Ps(45, 1, 999)], 'ep': [Ps(46, 1, 999)]}
    ,
    '325': { 'mp': [Ps(47, 1, 999), Ps(48, 1, 999)], 'ep': [Ps(49, 1, 999)]}
    ,
    '326': { 'mp': [Ps(50, 1, 999)], 'ep': [Ps(51, 1, 999)]}
    ,
    '327': {
      'mp': [Ps(52, 1, 999), Ps(53, 1, 999), Ps(54, 1, 999)],
      'ep': [Ps(55, 1, 999)]
    }
    ,
    '328': {
      'mp': [Ps(56, 1, 999), Ps(57, 1, 999)],
      'ep': [Ps(58, 1, 999), Ps(60, 1, 999)]
    }
    ,
    '329': { 'mp': [Ps(59, 1, 999)], 'ep': [Ps(63, 1, 999), Ps(64, 1, 999)]}
    ,
    '330': {
      'mp': [Ps(61, 1, 999), Ps(62, 1, 999)],
      'ep': [Ps(65, 1, 999), Ps(67, 1, 999)]
    }
    ,
    '331': { 'mp': [Ps(68, 1, 18)], 'ep': [Ps(68, 19, 36)]}
    ,
    '332': { 'mp': [Ps(69, 1, 18)], 'ep': [Ps(68, 19, 37)]}
    ,
    '333': { 'mp': [Ps(66, 1, 999)], 'ep': [Ps(70, 1, 999), Ps(72, 1, 999)]}
    ,
    '334': { 'mp': [Ps(71, 1, 999)], 'ep': [Ps(73, 1, 999)]}
    ,
    '335': { 'mp': [Ps(74, 1, 999)], 'ep': [Ps(77, 1, 999)]}
    ,
    '336': {
      'mp': [Ps(75, 1, 999), Ps(76, 1, 999)],
      'ep': [Ps(79, 1, 999), Ps(82, 1, 999)]
    }
    ,
    '337': { 'mp': [Ps(78, 1, 18)], 'ep': [Ps(78, 19, 40)]}
    ,
    '338': { 'mp': [Ps(78, 41, 73)], 'ep': [Ps(80, 1, 999)]}
    ,
    '339': { 'mp': [Ps(24, 1, 999), Ps(81, 1, 999)], 'ep': [Ps(84, 1, 999)]}
    ,
    '340': { 'mp': [Ps(83, 1, 999)], 'ep': [Ps(85, 1, 999)]}
    ,
    '341': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999)], 'ep': [Ps(88, 1, 999)]}
    ,
    '342': { 'mp': [Ps(89, 1, 18)], 'ep': [Ps(89, 19, 51)]}
    ,
    '343': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    '344': { 'mp': [Ps(92, 1, 999), Ps(93, 1, 999)], 'ep': [Ps(94, 1, 999)]}
    ,
    '345': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999)],
      'ep': [Ps(97, 1, 999), Ps(98, 1, 999)]
    }
    ,
    '346': {
      'mp': [Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)],
      'ep': [Ps(102, 1, 999)]
    }
    ,
    '347': { 'mp': [Ps(103, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '348': { 'mp': [Ps(105, 1, 22)], 'ep': [Ps(105, 23, 44)]}
    ,
    '349': { 'mp': [Ps(106, 1, 18)], 'ep': [Ps(106, 19, 46)]}
    ,
    '350': { 'mp': [Ps(107, 1, 22)], 'ep': [Ps(107, 23, 43)]}
    ,
    '351': { 'mp': [Ps(108, 1, 999), Ps(110, 1, 999)], 'ep': [Ps(109, 1, 999)]}
    ,
    '352': {
      'mp': [Ps(111, 1, 999), Ps(112, 1, 999)],
      'ep': [Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    '353': { 'mp': [Ps(115, 1, 999)], 'ep': [Ps(116, 1, 999), Ps(117, 1, 999)]}
    ,
    '354': { 'mp': [Ps(119, 1, 24)], 'ep': [Ps(119, 25, 48)]}
    ,
    '355': { 'mp': [Ps(119, 49, 72)], 'ep': [Ps(119, 73, 88)]}
    ,
    '356': { 'mp': [Ps(119, 89, 104)], 'ep': [Ps(119, 105, 128)]}
    ,
    '357': { 'mp': [Ps(119, 129, 152)], 'ep': [Ps(119, 153, 176)]}
    ,
    '358': { 'mp': [Ps(118, 1, 999)], 'ep': [Ps(120, 1, 999), Ps(121, 1, 999)]}
    ,
    '359': {
      'mp': [Ps(122, 1, 999), Ps(123, 1, 999)],
      'ep': [Ps(124, 1, 999), Ps(125, 1, 999), Ps(126, 1, 999)]
    }
    ,
    '360': {
      'mp': [Ps(127, 1, 999), Ps(128, 1, 999)],
      'ep': [Ps(129, 1, 999), Ps(130, 1, 999), Ps(131, 1, 999)]
    }
    ,
    '361': {
      'mp': [Ps(132, 1, 999), Ps(133, 1, 999)],
      'ep': [Ps(134, 1, 999), Ps(135, 1, 999)]
    }
    ,
    '362': { 'mp': [Ps(136, 1, 999)], 'ep': [Ps(137, 1, 999), Ps(138, 1, 999)]}
    ,
    '363': { 'mp': [Ps(139, 1, 999)], 'ep': [Ps(141, 1, 999), Ps(142, 1, 999)]}
    ,
    '364': { 'mp': [Ps(140, 1, 999)], 'ep': [Ps(143, 1, 999)]}
    ,
    '365': { 'mp': [Ps(144, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '366': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '1': { 'mp': [Ps(146, 1, 999)], 'ep': [Ps(147, 1, 999)]}
    ,
    '2': { 'mp': [Ps(148, 1, 999)], 'ep': [Ps(149, 1, 999), Ps(150, 1, 999)]}
    ,
    '3': { 'mp': [Ps(1, 1, 999), Ps(2, 1, 999)], 'ep': [Ps(3, 1, 999), Ps(4, 1, 999)]}
    ,
    '4': { 'mp': [Ps(5, 1, 999), Ps(6, 1, 999)], 'ep':  [Ps(7, 1, 999)]}
    ,
    '5': { 'mp': [Ps(9, 1, 999)], 'ep':  [Ps(10, 1, 999)]}
    ,
    '6': { 'mp': [Ps(8, 1, 999), Ps(11, 1, 999)], 'ep':  [Ps(15, 1, 999), Ps(16, 1, 999)]}
    ,
    '7': {
      'mp': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)],
      'ep':  [Ps(17, 1, 999)]
    }
    ,
    '8': { 'mp': [Ps(18, 1, 20)], 'ep':  [Ps(18, 21, 52)]}
    ,
    '9': { 'mp': [Ps(19, 1, 999)], 'ep': [Ps(20, 1, 999), Ps(21, 1, 999)]}
    ,
    '10': { 'mp': [Ps(22, 1, 999)], 'ep': [Ps(23, 1, 999), Ps(24, 1, 999)]}
    ,
    '11': { 'mp': [Ps(25, 1, 999)], 'ep': [Ps(27, 1, 999)]}
    ,
    '12': { 'mp': [Ps(26, 1, 999), Ps(28, 1, 999)], 'ep': [Ps(31, 1, 999)]}
    ,
    '13': { 'mp': [Ps(29, 1, 999), Ps(30, 1, 999)], 'ep': [Ps(33, 1, 999)]}
    ,
    '14': { 'mp': [Ps(34, 1, 999)], 'ep': [Ps(35, 1, 999)]}
    ,
    '15': { 'mp': [Ps(32, 1, 999), Ps(36, 1, 999)], 'ep': [Ps(38, 1, 999)]}
    ,
    '16': { 'mp': [Ps(37, 1, 17)], 'ep': [Ps(37, 18, 41)]}
    ,
    '17': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(39, 1, 999), Ps(41, 1, 999)]}
    ,
    '18': { 'mp': [Ps(42, 1, 999), Ps(43, 1, 999)], 'ep': [Ps(44, 1, 999)]}
    ,
    '19': { 'mp': [Ps(45, 1, 999)], 'ep': [Ps(46, 1, 999)]}
    ,
    '20': { 'mp': [Ps(47, 1, 999), Ps(48, 1, 999)], 'ep': [Ps(49, 1, 999)]}
    ,
    '21': { 'mp': [Ps(50, 1, 999)], 'ep': [Ps(51, 1, 999)]}
    ,
    '22': {
      'mp': [Ps(52, 1, 999), Ps(53, 1, 999), Ps(54, 1, 999)],
      'ep': [Ps(55, 1, 999)]
    }
    ,
    '23': {
      'mp': [Ps(56, 1, 999), Ps(57, 1, 999)],
      'ep': [Ps(58, 1, 999), Ps(60, 1, 999)]
    }
    ,
    '24': { 'mp': [Ps(59, 1, 999)], 'ep': [Ps(63, 1, 999), Ps(64, 1, 999)]}
    ,
    '25': {
      'mp': [Ps(113, 1, 999), Ps(138, 1, 999)],
      'ep': [Ps(131, 1, 999), Ps(132, 1, 999)]
    }
    ,
    '26': {
      'mp': [Ps(61, 1, 999), Ps(62, 1, 999)],
      'ep': [Ps(65, 1, 999), Ps(67, 1, 999)]
    }
    ,
    '27': { 'mp': [Ps(68, 1, 18)], 'ep': [Ps(68, 19, 36)]}
    ,
    '28': { 'mp': [Ps(69, 1, 18)], 'ep': [Ps(68, 19, 37)]}
    ,
    '29': { 'mp': [Ps(66, 1, 999)], 'ep': [Ps(70, 1, 999), Ps(72, 1, 999)]}
    ,
    '30': { 'mp': [Ps(71, 1, 999)], 'ep': [Ps(73, 1, 999)]}
    ,
    '31': { 'mp': [Ps(74, 1, 999)], 'ep': [Ps(77, 1, 999)]}
    ,
    '32': {
      'mp': [Ps(75, 1, 999), Ps(76, 1, 999)],
      'ep': [Ps(79, 1, 999), Ps(82, 1, 999)]
    }
    ,
    '33': { 'mp': [Ps(78, 1, 18)], 'ep': [Ps(78, 19, 40)]}
    ,
    '34': { 'mp': [Ps(78, 41, 73)], 'ep': [Ps(80, 1, 999)]}
    ,
    '35': { 'mp': [Ps(81, 1, 999)], 'ep': [Ps(83, 1, 999)]}
    ,
    '36': { 'mp': [Ps(84, 1, 999)], 'ep': [Ps(85, 1, 999)]}
    ,
    '37': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999)], 'ep': [Ps(88, 1, 999)]}
    ,
    '38': { 'mp': [Ps(89, 1, 18)], 'ep': [Ps(89, 19, 51)]}
    ,
    '39': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    '40': { 'mp': [Ps(92, 1, 999), Ps(93, 1, 999)], 'ep': [Ps(94, 1, 999)]}
    ,
    '41': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999)],
      'ep': [Ps(97, 1, 999), Ps(98, 1, 999)]
    }
    ,
    '42': {
      'mp': [Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)],
      'ep': [Ps(102, 1, 999)]
    }
    ,
    '43': { 'mp': [Ps(103, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '44': { 'mp': [Ps(105, 1, 22)], 'ep': [Ps(105, 23, 44)]}
    ,
    '45': { 'mp': [Ps(106, 1, 18)], 'ep': [Ps(106, 19, 46)]}
    ,
    '46': { 'mp': [Ps(107, 1, 22)], 'ep': [Ps(107, 23, 43)]}
    ,
    '47': { 'mp': [Ps(108, 1, 999), Ps(110, 1, 999)], 'ep': [Ps(109, 1, 999)]}
    ,
    '48': {
      'mp': [Ps(111, 1, 999), Ps(112, 1, 999)],
      'ep': [Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    '49': { 'mp': [Ps(115, 1, 999)], 'ep': [Ps(116, 1, 999), Ps(117, 1, 999)]}
    ,
    '50': { 'mp': [Ps(119, 1, 24)], 'ep': [Ps(119, 25, 48)]}
    ,
    '51': { 'mp': [Ps(119, 49, 72)], 'ep': [Ps(119, 73, 88)]}
    ,
    '52': { 'mp': [Ps(119, 89, 104)], 'ep': [Ps(119, 105, 128)]}
    ,
    '53': { 'mp': [Ps(119, 129, 152)], 'ep': [Ps(119, 153, 176)]}
    ,
    '54': { 'mp': [Ps(118, 1, 999)], 'ep': [Ps(120, 1, 999), Ps(121, 1, 999)]}
    ,
    '55': {
      'mp': [Ps(122, 1, 999), Ps(123, 1, 999)],
      'ep': [Ps(124, 1, 999), Ps(125, 1, 999), Ps(126, 1, 999)]
    }
    ,
    '56': {
      'mp': [Ps(127, 1, 999), Ps(128, 1, 999)],
      'ep': [Ps(129, 1, 999), Ps(130, 1, 999), Ps(131, 1, 999)]
    }
    ,
    '57': {
      'mp': [Ps(132, 1, 999), Ps(133, 1, 999)],
      'ep': [Ps(134, 1, 999), Ps(135, 1, 999)]
    }
    ,
    '58': { 'mp': [Ps(136, 1, 999)], 'ep': [Ps(137, 1, 999), Ps(138, 1, 999)]}
    ,
    '59': { 'mp': [Ps(139, 1, 999)], 'ep': [Ps(141, 1, 999), Ps(142, 1, 999)]}
    ,
    '60': { 'mp': [Ps(140, 1, 999)], 'ep': [Ps(143, 1, 999)]}
    ,
    '61': { 'mp': [Ps(144, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '62': { 'mp': [Ps(146, 1, 999)], 'ep': [Ps(147, 1, 999)]}
    ,
    '63': { 'mp': [Ps(148, 1, 999)], 'ep': [Ps(149, 1, 999), Ps(150, 1, 999)]}
    ,
    '64': { 'mp': [Ps(1, 1, 999), Ps(2, 1, 999)], 'ep': [Ps(3, 1, 999), Ps(4, 1, 999)]}
    ,
    '65': { 'mp': [Ps(5, 1, 999), Ps(6, 1, 999)], 'ep':  [Ps(7, 1, 999)]}
    ,
    '66': { 'mp': [Ps(9, 1, 999)], 'ep':  [Ps(10, 1, 999)]}
    ,
    '67': {
      'mp': [Ps(8, 1, 999), Ps(11, 1, 999)],
      'ep':  [Ps(15, 1, 999), Ps(16, 1, 999)]
    }
    ,
    '68': {
      'mp': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)],
      'ep':  [Ps(17, 1, 999)]
    }
    ,
    '69': { 'mp': [Ps(18, 1, 20)], 'ep':  [Ps(18, 21, 52)]}
    ,
    '70': { 'mp': [Ps(19, 1, 999)], 'ep': [Ps(20, 1, 999), Ps(21, 1, 999)]}
    ,
    '71': { 'mp': [Ps(22, 1, 999)], 'ep': [Ps(23, 1, 999), Ps(24, 1, 999)]}
    ,
    '72': { 'mp': [Ps(25, 1, 999)], 'ep': [Ps(27, 1, 999)]}
    ,
    '73': { 'mp': [Ps(26, 1, 999), Ps(28, 1, 999)], 'ep': [Ps(31, 1, 999)]}
    ,
    '74': { 'mp': [Ps(29, 1, 999), Ps(30, 1, 999)], 'ep': [Ps(33, 1, 999)]}
    ,
    '75': { 'mp': [Ps(34, 1, 999)], 'ep': [Ps(35, 1, 999)]}
    ,
    '76': { 'mp': [Ps(32, 1, 999), Ps(36, 1, 999)], 'ep': [Ps(38, 1, 999)]}
    ,
    '77': { 'mp': [Ps(37, 1, 17)], 'ep': [Ps(37, 18, 41)]}
    ,
    '78': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(39, 1, 999), Ps(41, 1, 999)]}
    ,
    '79': { 'mp': [Ps(42, 1, 999), Ps(43, 1, 999)], 'ep': [Ps(44, 1, 999)]}
    ,
    '80': { 'mp': [Ps(45, 1, 999)], 'ep': [Ps(46, 1, 999)]}
    ,
    '81': { 'mp': [Ps(47, 1, 999), Ps(48, 1, 999)], 'ep': [Ps(49, 1, 999)]}
    ,
    '82': { 'mp': [Ps(50, 1, 999)], 'ep': [Ps(51, 1, 999)]}
    ,
    '83': {
      'mp': [Ps(52, 1, 999), Ps(53, 1, 999), Ps(54, 1, 999)],
      'ep': [Ps(55, 1, 999)]
    }
    ,
    '84': {
      'mp': [Ps(56, 1, 999), Ps(57, 1, 999)],
      'ep': [Ps(58, 1, 999), Ps(60, 1, 999)]
    }
    ,
    '85': { 'mp': [Ps(59, 1, 999)], 'ep': [Ps(63, 1, 999), Ps(64, 1, 999)]}
    ,
    '86': {
      'mp': [Ps(61, 1, 999), Ps(62, 1, 999)],
      'ep': [Ps(65, 1, 999), Ps(67, 1, 999)]
    }
    ,
    '87': { 'mp': [Ps(68, 1, 18)], 'ep': [Ps(68, 19, 36)]}
    ,
    '88': { 'mp': [Ps(69, 1, 18)], 'ep': [Ps(68, 19, 37)]}
    ,
    '89': { 'mp': [Ps(66, 1, 999)], 'ep': [Ps(70, 1, 999), Ps(72, 1, 999)]}
    ,
    '90': { 'mp': [Ps(71, 1, 999)], 'ep': [Ps(73, 1, 999)]}
    ,
    '91': { 'mp': [Ps(74, 1, 999)], 'ep': [Ps(77, 1, 999)]}
    ,
    '92': {
      'mp': [Ps(75, 1, 999), Ps(76, 1, 999)],
      'ep': [Ps(79, 1, 999), Ps(82, 1, 999)]
    }
    ,
    '93': { 'mp': [Ps(78, 1, 18)], 'ep': [Ps(78, 19, 40)]}
    ,
    '94': { 'mp': [Ps(78, 41, 73)], 'ep': [Ps(80, 1, 999)]}
    ,
    '95': { 'mp': [Ps(81, 1, 999)], 'ep': [Ps(83, 1, 999)]}
    ,
    '96': { 'mp': [Ps(84, 1, 999)], 'ep': [Ps(85, 1, 999)]}
    ,
    '97': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999)], 'ep': [Ps(88, 1, 999)]}
    ,
    '98': { 'mp': [Ps(89, 1, 18)], 'ep': [Ps(89, 19, 51)]}
    ,
    '99': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    '100': { 'mp': [Ps(92, 1, 999), Ps(93, 1, 999)], 'ep': [Ps(94, 1, 999)]}
    ,
    '101': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999)],
      'ep': [Ps(97, 1, 999), Ps(98, 1, 999)]
    }
    ,
    '102': {
      'mp': [Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)],
      'ep': [Ps(102, 1, 999)]
    }
    ,
    '103': { 'mp': [Ps(103, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '104': { 'mp': [Ps(105, 1, 22)], 'ep': [Ps(105, 23, 44)]}
    ,
    '105': { 'mp': [Ps(106, 1, 18)], 'ep': [Ps(106, 19, 46)]}
    ,
    '106': { 'mp': [Ps(107, 1, 22)], 'ep': [Ps(107, 23, 43)]}
    ,
    '107': { 'mp': [Ps(108, 1, 999), Ps(110, 1, 999)], 'ep': [Ps(109, 1, 999)]}
    ,
    '108': {
      'mp': [Ps(111, 1, 999), Ps(112, 1, 999)],
      'ep': [Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    '109': { 'mp': [Ps(115, 1, 999)], 'ep': [Ps(116, 1, 999), Ps(117, 1, 999)]}
    ,
    '110': { 'mp': [Ps(119, 1, 24)], 'ep': [Ps(119, 25, 48)]}
    ,
    '111': { 'mp': [Ps(119, 49, 72)], 'ep': [Ps(119, 73, 88)]}
    ,
    '112': { 'mp': [Ps(119, 89, 104)], 'ep': [Ps(119, 105, 128)]}
    ,
    '113': { 'mp': [Ps(119, 129, 152)], 'ep': [Ps(119, 153, 176)]}
    ,
    '114': { 'mp': [Ps(118, 1, 999)], 'ep': [Ps(120, 1, 999), Ps(121, 1, 999)]}
    ,
    '115': {
      'mp': [Ps(122, 1, 999), Ps(123, 1, 999)],
      'ep': [Ps(124, 1, 999), Ps(125, 1, 999), Ps(126, 1, 999)]
    }
    ,
    '116': {
      'mp': [Ps(127, 1, 999), Ps(128, 1, 999)],
      'ep': [Ps(129, 1, 999), Ps(130, 1, 999), Ps(131, 1, 999)]
    }
    ,
    '117': {
      'mp': [Ps(132, 1, 999), Ps(133, 1, 999)],
      'ep': [Ps(134, 1, 999), Ps(135, 1, 999)]
    }
    ,
    '118': { 'mp': [Ps(136, 1, 999)], 'ep': [Ps(137, 1, 999), Ps(138, 1, 999)]}
    ,
    '119': { 'mp': [Ps(139, 1, 999)], 'ep': [Ps(141, 1, 999), Ps(142, 1, 999)]}
    ,
    '120': { 'mp': [Ps(140, 1, 999)], 'ep': [Ps(143, 1, 999)]}
    ,
    '121': { 'mp': [Ps(144, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '122': { 'mp': [Ps(146, 1, 999)], 'ep': [Ps(147, 1, 999)]}
    ,
    '123': { 'mp': [Ps(148, 1, 999)], 'ep': [Ps(149, 1, 999), Ps(150, 1, 999)]}
    ,
    '124': { 'mp': [Ps(1, 1, 999), Ps(2, 1, 999)], 'ep': [Ps(3, 1, 999), Ps(4, 1, 999)]}
    ,
    '125': { 'mp': [Ps(5, 1, 999), Ps(6, 1, 999)], 'ep':  [Ps(7, 1, 999)]}
    ,
    '126': { 'mp': [Ps(9, 1, 999)], 'ep':  [Ps(10, 1, 999)]}
    ,
    '127': {
      'mp': [Ps(8, 1, 999), Ps(11, 1, 999)],
      'ep':  [Ps(15, 1, 999), Ps(16, 1, 999)]
    }
    ,
    '128': {
      'mp': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)],
      'ep':  [Ps(17, 1, 999)]
    }
    ,
    '129': { 'mp': [Ps(18, 1, 20)], 'ep':  [Ps(18, 21, 52)]}
    ,
    '130': { 'mp': [Ps(19, 1, 999)], 'ep': [Ps(20, 1, 999), Ps(21, 1, 999)]}
    ,
    '131': { 'mp': [Ps(22, 1, 999)], 'ep': [Ps(23, 1, 999), Ps(24, 1, 999)]}
    ,
    '132': { 'mp': [Ps(25, 1, 999)], 'ep': [Ps(27, 1, 999)]}
    ,
    '133': { 'mp': [Ps(26, 1, 999), Ps(28, 1, 999)], 'ep': [Ps(31, 1, 999)]}
    ,
    '134': { 'mp': [Ps(29, 1, 999), Ps(30, 1, 999)], 'ep': [Ps(33, 1, 999)]}
    ,
    '135': { 'mp': [Ps(34, 1, 999)], 'ep': [Ps(35, 1, 999)]}
    ,
    '136': { 'mp': [Ps(32, 1, 999), Ps(36, 1, 999)], 'ep': [Ps(38, 1, 999)]}
    ,
    '137': { 'mp': [Ps(37, 1, 17)], 'ep': [Ps(37, 18, 41)]}
    ,
    '138': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(39, 1, 999), Ps(41, 1, 999)]}
    ,
    '139': { 'mp': [Ps(42, 1, 999), Ps(43, 1, 999)], 'ep': [Ps(44, 1, 999)]}
    ,
    '140': { 'mp': [Ps(45, 1, 999)], 'ep': [Ps(46, 1, 999)]}
    ,
    '141': { 'mp': [Ps(47, 1, 999), Ps(48, 1, 999)], 'ep': [Ps(49, 1, 999)]}
    ,
    '142': { 'mp': [Ps(50, 1, 999)], 'ep': [Ps(51, 1, 999)]}
    ,
    '143': {
      'mp': [Ps(52, 1, 999), Ps(53, 1, 999), Ps(54, 1, 999)],
      'ep': [Ps(55, 1, 999)]
    }
    ,
    '144': {
      'mp': [Ps(56, 1, 999), Ps(57, 1, 999)],
      'ep': [Ps(58, 1, 999), Ps(60, 1, 999)]
    }
    ,
    '145': { 'mp': [Ps(59, 1, 999)], 'ep': [Ps(63, 1, 999), Ps(64, 1, 999)]}
    ,
    '146': {
      'mp': [Ps(61, 1, 999), Ps(62, 1, 999)],
      'ep': [Ps(65, 1, 999), Ps(67, 1, 999)]
    }
    ,
    '147': { 'mp': [Ps(68, 1, 18)], 'ep': [Ps(68, 19, 36)]}
    ,
    '148': { 'mp': [Ps(69, 1, 18)], 'ep': [Ps(68, 19, 37)]}
    ,
    '149': { 'mp': [Ps(66, 1, 999)], 'ep': [Ps(70, 1, 999), Ps(72, 1, 999)]}
    ,
    '150': { 'mp': [Ps(71, 1, 999)], 'ep': [Ps(73, 1, 999)]}
    ,
    '151': { 'mp': [Ps(74, 1, 999)], 'ep': [Ps(77, 1, 999)]}
    ,
    '152': {
      'mp': [Ps(75, 1, 999), Ps(76, 1, 999)],
      'ep': [Ps(79, 1, 999), Ps(82, 1, 999)]
    }
    ,
    '153': { 'mp': [Ps(78, 1, 18)], 'ep': [Ps(78, 19, 40)]}
    ,
    '154': { 'mp': [Ps(78, 41, 73)], 'ep': [Ps(80, 1, 999)]}
    ,
    '155': { 'mp': [Ps(81, 1, 999)], 'ep': [Ps(83, 1, 999)]}
    ,
    '156': { 'mp': [Ps(84, 1, 999)], 'ep': [Ps(85, 1, 999)]}
    ,
    '157': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999)], 'ep': [Ps(88, 1, 999)]}
    ,
    '158': { 'mp': [Ps(89, 1, 18)], 'ep': [Ps(89, 19, 51)]}
    ,
    '159': { 'mp': [Ps(27, 1, 999)], 'ep': [Ps(80, 1, 999)]}
    ,
    '160': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    '161': { 'mp': [Ps(92, 1, 999), Ps(93, 1, 999)], 'ep': [Ps(94, 1, 999)]}
    ,
    '162': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999)],
      'ep': [Ps(97, 1, 999), Ps(98, 1, 999)]
    }
    ,
    '163': {
      'mp': [Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)],
      'ep': [Ps(102, 1, 999)]
    }
    ,
    '164': { 'mp': [Ps(103, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '165': { 'mp': [Ps(105, 1, 22)], 'ep': [Ps(105, 23, 44)]}
    ,
    '166': { 'mp': [Ps(106, 1, 18)], 'ep': [Ps(106, 19, 46)]}
    ,
    '167': { 'mp': [Ps(107, 1, 22)], 'ep': [Ps(107, 23, 43)]}
    ,
    '168': { 'mp': [Ps(108, 1, 999), Ps(110, 1, 999)], 'ep': [Ps(109, 1, 999)]}
    ,
    '169': {
      'mp': [Ps(111, 1, 999), Ps(112, 1, 999)],
      'ep': [Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    '170': { 'mp': [Ps(115, 1, 999)], 'ep': [Ps(116, 1, 999), Ps(117, 1, 999)]}
    ,
    '171': { 'mp': [Ps(119, 1, 24)], 'ep': [Ps(119, 25, 48)]}
    ,
    '172': { 'mp': [Ps(119, 49, 72)], 'ep': [Ps(119, 73, 88)]}
    ,
    '173': { 'mp': [Ps(119, 89, 104)], 'ep': [Ps(119, 105, 128)]}
    ,
    '174': { 'mp': [Ps(119, 129, 152)], 'ep': [Ps(119, 153, 176)]}
    ,
    '175': { 'mp': [Ps(118, 1, 999)], 'ep': [Ps(120, 1, 999), Ps(121, 1, 999)]}
    ,
    '176': {
      'mp': [Ps(122, 1, 999), Ps(123, 1, 999)],
      'ep': [Ps(124, 1, 999), Ps(125, 1, 999), Ps(126, 1, 999)]
    }
    ,
    '177': {
      'mp': [Ps(127, 1, 999), Ps(128, 1, 999)],
      'ep': [Ps(129, 1, 999), Ps(130, 1, 999), Ps(131, 1, 999)]
    }
    ,
    '178': {
      'mp': [Ps(132, 1, 999), Ps(133, 1, 999)],
      'ep': [Ps(134, 1, 999), Ps(135, 1, 999)]
    }
    ,
    '179': { 'mp': [Ps(136, 1, 999)], 'ep': [Ps(137, 1, 999), Ps(138, 1, 999)]}
    ,
    '180': { 'mp': [Ps(139, 1, 999)], 'ep': [Ps(141, 1, 999), Ps(142, 1, 999)]}
    ,
    '181': { 'mp': [Ps(140, 1, 999)], 'ep': [Ps(143, 1, 999)]}
    ,
    '182': { 'mp': [Ps(144, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '183': { 'mp': [Ps(146, 1, 999)], 'ep': [Ps(147, 1, 999)]}
    ,
    '184': { 'mp': [Ps(148, 1, 999)], 'ep': [Ps(149, 1, 999), Ps(150, 1, 999)]}
    ,
    '185': { 'mp': [Ps(1, 1, 999), Ps(2, 1, 999)], 'ep': [Ps(3, 1, 999), Ps(4, 1, 999)]}
    ,
    '186': { 'mp': [Ps(5, 1, 999), Ps(6, 1, 999)], 'ep':  [Ps(7, 1, 999)]}
    ,
    '187': { 'mp': [Ps(9, 1, 999)], 'ep':  [Ps(10, 1, 999)]}
    ,
    '188': {
      'mp': [Ps(8, 1, 999), Ps(11, 1, 999)],
      'ep':  [Ps(15, 1, 999), Ps(16, 1, 999)]
    }
    ,
    '189': {
      'mp': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)],
      'ep':  [Ps(17, 1, 999)]
    }
    ,
    '190': { 'mp': [Ps(18, 1, 20)], 'ep':  [Ps(18, 21, 52)]}
    ,
    '191': { 'mp': [Ps(19, 1, 999)], 'ep': [Ps(20, 1, 999), Ps(21, 1, 999)]}
    ,
    '192': { 'mp': [Ps(22, 1, 999)], 'ep': [Ps(23, 1, 999), Ps(24, 1, 999)]}
    ,
    '193': { 'mp': [Ps(25, 1, 999)], 'ep': [Ps(27, 1, 999)]}
    ,
    '194': { 'mp': [Ps(26, 1, 999), Ps(28, 1, 999)], 'ep': [Ps(31, 1, 999)]}
    ,
    '195': { 'mp': [Ps(29, 1, 999), Ps(30, 1, 999)], 'ep': [Ps(33, 1, 999)]}
    ,
    '196': { 'mp': [Ps(34, 1, 999)], 'ep': [Ps(35, 1, 999)]}
    ,
    '197': { 'mp': [Ps(32, 1, 999), Ps(36, 1, 999)], 'ep': [Ps(38, 1, 999)]}
    ,
    '198': { 'mp': [Ps(37, 1, 17)], 'ep': [Ps(37, 18, 41)]}
    ,
    '199': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(39, 1, 999), Ps(41, 1, 999)]}
    ,
    '200': { 'mp': [Ps(42, 1, 999), Ps(43, 1, 999)], 'ep': [Ps(44, 1, 999)]}
    ,
    '201': { 'mp': [Ps(45, 1, 999)], 'ep': [Ps(46, 1, 999)]}
    ,
    '202': { 'mp': [Ps(47, 1, 999), Ps(48, 1, 999)], 'ep': [Ps(49, 1, 999)]}
    ,
    '203': { 'mp': [Ps(50, 1, 999)], 'ep': [Ps(51, 1, 999)]}
    ,
    '204': {
      'mp': [Ps(52, 1, 999), Ps(53, 1, 999), Ps(54, 1, 999)],
      'ep': [Ps(55, 1, 999)]
    }
    ,
    '205': {
      'mp': [Ps(56, 1, 999), Ps(57, 1, 999)],
      'ep': [Ps(58, 1, 999), Ps(60, 1, 999)]
    }
    ,
    '206': { 'mp': [Ps(59, 1, 999)], 'ep': [Ps(63, 1, 999), Ps(64, 1, 999)]}
    ,
    '207': {
      'mp': [Ps(61, 1, 999), Ps(62, 1, 999)],
      'ep': [Ps(65, 1, 999), Ps(67, 1, 999)]
    }
    ,
    '208': { 'mp': [Ps(68, 1, 18)], 'ep': [Ps(68, 19, 36)]}
    ,
    '209': { 'mp': [Ps(69, 1, 18)], 'ep': [Ps(68, 19, 37)]}
    ,
    '210': { 'mp': [Ps(66, 1, 999)], 'ep': [Ps(70, 1, 999), Ps(72, 1, 999)]}
    ,
    '211': { 'mp': [Ps(71, 1, 999)], 'ep': [Ps(73, 1, 999)]}
    ,
    '212': { 'mp': [Ps(74, 1, 999)], 'ep': [Ps(77, 1, 999)]}
    ,
    '213': {
      'mp': [Ps(75, 1, 999), Ps(76, 1, 999)],
      'ep': [Ps(79, 1, 999), Ps(82, 1, 999)]
    }
    ,
    '214': { 'mp': [Ps(78, 1, 18)], 'ep': [Ps(78, 19, 40)]}
    ,
    '215': { 'mp': [Ps(78, 41, 73)], 'ep': [Ps(80, 1, 999)]}
    ,
    '216': { 'mp': [Ps(81, 1, 999)], 'ep': [Ps(83, 1, 999)]}
    ,
    '217': { 'mp': [Ps(84, 1, 999)], 'ep': [Ps(85, 1, 999)]}
    ,
    '218': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999)], 'ep': [Ps(88, 1, 999)]}
    ,
    '219': { 'mp': [Ps(89, 1, 18)], 'ep': [Ps(89, 19, 51)]}
    ,
    '220': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    '221': { 'mp': [Ps(92, 1, 999), Ps(93, 1, 999)], 'ep': [Ps(94, 1, 999)]}
    ,
    '222': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999)],
      'ep': [Ps(97, 1, 999), Ps(98, 1, 999)]
    }
    ,
    '223': {
      'mp': [Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)],
      'ep': [Ps(102, 1, 999)]
    }
    ,
    '224': { 'mp': [Ps(103, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '225': { 'mp': [Ps(105, 1, 22)], 'ep': [Ps(105, 23, 44)]}
    ,
    '226': { 'mp': [Ps(106, 1, 18)], 'ep': [Ps(106, 19, 46)]}
    ,
    '227': { 'mp': [Ps(107, 1, 22)], 'ep': [Ps(107, 23, 43)]}
    ,
    '228': { 'mp': [Ps(108, 1, 999), Ps(110, 1, 999)], 'ep': [Ps(109, 1, 999)]}
    ,
    '229': {
      'mp': [Ps(111, 1, 999), Ps(112, 1, 999)],
      'ep': [Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    '230': { 'mp': [Ps(115, 1, 999)], 'ep': [Ps(116, 1, 999), Ps(117, 1, 999)]}
    ,
    '231': { 'mp': [Ps(119, 1, 24)], 'ep': [Ps(119, 25, 48)]}
    ,
    '232': { 'mp': [Ps(119, 49, 72)], 'ep': [Ps(119, 73, 88)]}
    ,
    '233': { 'mp': [Ps(119, 89, 104)], 'ep': [Ps(119, 105, 128)]}
    ,
    '234': { 'mp': [Ps(119, 129, 152)], 'ep': [Ps(119, 153, 176)]}
    ,
    '235': { 'mp': [Ps(118, 1, 999)], 'ep': [Ps(120, 1, 999), Ps(121, 1, 999)]}
    ,
    '236': {
      'mp': [Ps(122, 1, 999), Ps(123, 1, 999)],
      'ep': [Ps(124, 1, 999), Ps(125, 1, 999), Ps(126, 1, 999)]
    }
    ,
    '237': {
      'mp': [Ps(127, 1, 999), Ps(128, 1, 999)],
      'ep': [Ps(129, 1, 999), Ps(130, 1, 999), Ps(131, 1, 999)]
    }
    ,
    '238': {
      'mp': [Ps(132, 1, 999), Ps(133, 1, 999)],
      'ep': [Ps(134, 1, 999), Ps(135, 1, 999)]
    }
    ,
    '239': { 'mp': [Ps(136, 1, 999)], 'ep': [Ps(137, 1, 999), Ps(138, 1, 999)]}
    ,
    '240': { 'mp': [Ps(139, 1, 999)], 'ep': [Ps(141, 1, 999), Ps(142, 1, 999)]}
    ,
    '241': { 'mp': [Ps(140, 1, 999)], 'ep': [Ps(143, 1, 999)]}
    ,
    '242': { 'mp': [Ps(144, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '243': { 'mp': [Ps(146, 1, 999)], 'ep': [Ps(147, 1, 999)]}
    ,
    '244': { 'mp': [Ps(148, 1, 999)], 'ep': [Ps(149, 1, 999), Ps(150, 1, 999)]}
    ,
    '245': { 'mp': [Ps(2, 1, 999)], 'ep': [Ps(3, 1, 999), Ps(4, 1, 999)]}
    ,
    '246': { 'mp': [Ps(1, 1, 999), Ps(15, 1, 999)], 'ep': [Ps(34, 1, 999)]}
    ,
    '247': { 'mp': [Ps(5, 1, 999), Ps(6, 1, 999)], 'ep':  [Ps(7, 1, 999)]}
    ,
    '248': { 'mp': [Ps(9, 1, 999)], 'ep':  [Ps(10, 1, 999)]}
    ,
    '249': {
      'mp': [Ps(8, 1, 999), Ps(11, 1, 999)],
      'ep':  [Ps(15, 1, 999), Ps(16, 1, 999)]
    }
    ,
    '250': {
      'mp': [Ps(12, 1, 999), Ps(13, 1, 999), Ps(14, 1, 999)],
      'ep':  [Ps(17, 1, 999)]
    }
    ,
    '251': { 'mp': [Ps(18, 1, 20)], 'ep':  [Ps(18, 21, 52)]}
    ,
    '252': { 'mp': [Ps(19, 1, 999)], 'ep': [Ps(20, 1, 999), Ps(21, 1, 999)]}
    ,
    '253': { 'mp': [Ps(22, 1, 999)], 'ep': [Ps(23, 1, 999), Ps(24, 1, 999)]}
    ,
    '254': { 'mp': [Ps(25, 1, 999)], 'ep': [Ps(27, 1, 999)]}
    ,
    '255': { 'mp': [Ps(26, 1, 999), Ps(28, 1, 999)], 'ep': [Ps(31, 1, 999)]}
    ,
    '256': { 'mp': [Ps(29, 1, 999), Ps(30, 1, 999)], 'ep': [Ps(33, 1, 999)]}
    ,
    '257': { 'mp': [Ps(34, 1, 999)], 'ep': [Ps(35, 1, 999)]}
    ,
    '258': { 'mp': [Ps(32, 1, 999), Ps(36, 1, 999)], 'ep': [Ps(38, 1, 999)]}
    ,
    '259': { 'mp': [Ps(37, 1, 17)], 'ep': [Ps(37, 18, 41)]}
    ,
    '260': { 'mp': [Ps(40, 1, 999)], 'ep': [Ps(39, 1, 999), Ps(41, 1, 999)]}
    ,
    '261': { 'mp': [Ps(42, 1, 999), Ps(43, 1, 999)], 'ep': [Ps(44, 1, 999)]}
    ,
    '262': { 'mp': [Ps(45, 1, 999)], 'ep': [Ps(46, 1, 999)]}
    ,
    '263': { 'mp': [Ps(47, 1, 999), Ps(48, 1, 999)], 'ep': [Ps(49, 1, 999)]}
    ,
    '264': { 'mp': [Ps(50, 1, 999)], 'ep': [Ps(51, 1, 999)]}
    ,
    '265': {
      'mp': [Ps(52, 1, 999), Ps(53, 1, 999), Ps(54, 1, 999)],
      'ep': [Ps(55, 1, 999)]
    }
    ,
    '266': {
      'mp': [Ps(56, 1, 999), Ps(57, 1, 999)],
      'ep': [Ps(58, 1, 999), Ps(60, 1, 999)]
    }
    ,
    '267': { 'mp': [Ps(59, 1, 999)], 'ep': [Ps(63, 1, 999), Ps(64, 1, 999)]}
    ,
    '268': {
      'mp': [Ps(61, 1, 999), Ps(62, 1, 999)],
      'ep': [Ps(65, 1, 999), Ps(67, 1, 999)]
    }
    ,
    '269': { 'mp': [Ps(68, 1, 18)], 'ep': [Ps(68, 19, 36)]}
    ,
    '270': { 'mp': [Ps(69, 1, 18)], 'ep': [Ps(68, 19, 37)]}
    ,
    '271': { 'mp': [Ps(66, 1, 999)], 'ep': [Ps(70, 1, 999), Ps(72, 1, 999)]}
    ,
    '272': { 'mp': [Ps(71, 1, 999)], 'ep': [Ps(73, 1, 999)]}
    ,
    '273': { 'mp': [Ps(74, 1, 999)], 'ep': [Ps(77, 1, 999)]}
    ,
    '274': {
      'mp': [Ps(75, 1, 999), Ps(76, 1, 999)],
      'ep': [Ps(79, 1, 999), Ps(82, 1, 999)]
    }
    ,
    '275': { 'mp': [Ps(78, 1, 18)], 'ep': [Ps(78, 19, 40)]}
    ,
    '276': { 'mp': [Ps(78, 41, 73)], 'ep': [Ps(80, 1, 999)]}
    ,
    '277': { 'mp': [Ps(81, 1, 999)], 'ep': [Ps(83, 1, 999)]}
    ,
    '278': { 'mp': [Ps(84, 1, 999)], 'ep': [Ps(85, 1, 999)]}
    ,
    '279': { 'mp': [Ps(86, 1, 999), Ps(87, 1, 999)], 'ep': [Ps(88, 1, 999)]}
    ,
    '280': { 'mp': [Ps(89, 1, 18)], 'ep': [Ps(89, 19, 51)]}
    ,
    '281': { 'mp': [Ps(90, 1, 999)], 'ep': [Ps(91, 1, 999)]}
    ,
    '282': { 'mp': [Ps(92, 1, 999), Ps(93, 1, 999)], 'ep': [Ps(94, 1, 999)]}
    ,
    '283': {
      'mp': [Ps(95, 1, 999), Ps(96, 1, 999)],
      'ep': [Ps(97, 1, 999), Ps(98, 1, 999)]
    }
    ,
    '284': {
      'mp': [Ps(99, 1, 999), Ps(100, 1, 999), Ps(101, 1, 999)],
      'ep': [Ps(102, 1, 999)]
    }
    ,
    '285': { 'mp': [Ps(103, 1, 999)], 'ep': [Ps(104, 1, 999)]}
    ,
    '286': { 'mp': [Ps(105, 1, 22)], 'ep': [Ps(105, 23, 44)]}
    ,
    '287': { 'mp': [Ps(106, 1, 18)], 'ep': [Ps(106, 19, 46)]}
    ,
    '288': { 'mp': [Ps(107, 1, 22)], 'ep': [Ps(107, 23, 43)]}
    ,
    '289': { 'mp': [Ps(108, 1, 999), Ps(110, 1, 999)], 'ep': [Ps(109, 1, 999)]}
    ,
    '290': {
      'mp': [Ps(111, 1, 999), Ps(112, 1, 999)],
      'ep': [Ps(113, 1, 999), Ps(114, 1, 999)]
    }
    ,
    '291': { 'mp': [Ps(115, 1, 999)], 'ep': [Ps(116, 1, 999), Ps(117, 1, 999)]}
    ,
    '292': { 'mp': [Ps(119, 1, 24)], 'ep': [Ps(119, 25, 48)]}
    ,
    '293': { 'mp': [Ps(119, 49, 72)], 'ep': [Ps(119, 73, 88)]}
    ,
    '294': { 'mp': [Ps(119, 89, 104)], 'ep': [Ps(119, 105, 128)]}
    ,
    '295': { 'mp': [Ps(119, 129, 152)], 'ep': [Ps(119, 153, 176)]}
    ,
    '296': { 'mp': [Ps(118, 1, 999)], 'ep': [Ps(120, 1, 999), Ps(121, 1, 999)]}
    ,
    '297': {
      'mp': [Ps(122, 1, 999), Ps(123, 1, 999)],
      'ep': [Ps(124, 1, 999), Ps(125, 1, 999), Ps(126, 1, 999)]
    }
    ,
    '298': {
      'mp': [Ps(127, 1, 999), Ps(128, 1, 999)],
      'ep': [Ps(129, 1, 999), Ps(130, 1, 999), Ps(131, 1, 999)]
    }
    ,
    '299': {
      'mp': [Ps(132, 1, 999), Ps(133, 1, 999)],
      'ep': [Ps(134, 1, 999), Ps(135, 1, 999)]
    }
    ,
    '300': {
      'mp': [Ps(19, 1, 999), Ps(45, 1, 999)],
      'ep': [Ps(85, 1, 999), Ps(110, 1, 999)]
    }
    ,
    '301': { 'mp': [Ps(136, 1, 999)], 'ep': [Ps(137, 1, 999), Ps(138, 1, 999)]}
    ,
    '302': { 'mp': [Ps(139, 1, 999)], 'ep': [Ps(141, 1, 999), Ps(142, 1, 999)]}
    ,
    '303': { 'mp': [Ps(140, 1, 999)], 'ep': [Ps(143, 1, 999)]}
    ,
    '304': { 'mp': [Ps(144, 1, 999)], 'ep': [Ps(145, 1, 999)]}
    ,
    '305': { 'mp': [Ps(146, 1, 999)], 'ep': [Ps(147, 1, 999)]}
    ,
    '306': { 'mp': [Ps(148, 1, 999)], 'ep': [Ps(149, 1, 999), Ps(150, 1, 999)]}
  };
}