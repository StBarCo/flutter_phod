import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/parts.dart';

class Antiphon extends StatelessWidget {
  final String season;
  Antiphon({Key key, this.season}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('ANTIPHON $season: ${antiphons[season]}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: antiphons[season].map<Widget>( (a) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start
            , children: <Widget>[
                  Text(a['say'])
                , ( a['alleluia'] == true ) ? Text("O come, let us adore him. Alleluia"):Text("O come, let us adore him.")
                , ( a['orThis'] == true ) ? Rubric( text: 'or this') : Container()
            ]
          );
        }).toList()
      );
  }
}

const Map antiphons = {
  'proper': [
    { 'say': "The earth is the Lord’s for he made it: *"
      , 'orThis': true
    }
    , { 'say': "Worship the Lord in the beauty of holiness: *"
      , 'orThis': true
    }
    , { 'say': "The mercy of the Lord is everlasting: *"
    }
  ]
  , 'advent': [
    { 'say': "Our King and Savior now draws near: *"}
  ]
  , 'christmas': [
    { 'say': "Alleluia, to us a child is born: *"
      , 'alleluia': true
    }
  ]
  , 'epiphany': [
    { 'say': "The Lord has shown forth his glory: *"}
  ]
  , 'presentation': [
    { 'say': "The Lord has shown forth his glory: *"}
  ]
  , 'annunciation': [
    { 'say': "The Word was made flesh and dwelt among us: *"}
  ]
  , 'lent': [
    { 'say': "The Lord is full of compassion and mercy: *"}
  ]
  , 'easter': [
    { 'say': "Alleluia. The Lord is risen indeed: *"
      , 'alleluia': true
    }
  ]
  , 'ascension': [
    { 'say': "Alleluia. Christ the Lord has ascended into heaven: *"
      , 'alleluia': true
    }
  ]
  , 'penetcost': [
    { 'say': "Alleluia. The Spirit of the Lord renews the face of the earth: *"
      , 'alleluia': true
    }
  ]
  , 'trinity': [
    { 'say': "Father, Son, and Holy Spirit, one God: *"}
  ]
  , 'all_saints': [
    { 'say': "The Lord is glorious in his saints: *"}
  ]
};
