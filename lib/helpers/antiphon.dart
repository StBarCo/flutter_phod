import 'package:flutter/material.dart';
import 'package:legereme/helpers/rubric.dart';

class Antiphon extends StatelessWidget {
  String season;
  Antiphon({Key key, this.season}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: antiphons(season).map<Widget>( (a) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start
            , children: <Widget>[
                  Text(a['say'])
                , ( a['alleluia'] == true ) ? Text("O come, let us adore him. Alleluia"):Text("O come, let us adore him.")
                , ( a['orThis'] == true ) ? Rubric('or this') : Container()
            ]
          );
        }).toList()
      );
  }
}

antiphons(String a) {
  switch (a) {
    case "advent":
      return [
        { 'say': "Our King and Savior now draws near: *"}
      ];
    case "christmas":
      return [
        { 'say': "Alleluia, to us a child is born: *"
          , 'alleluia': true
        }
      ];
    case "epiphany":
      return [
        { 'say': "The Lord has shown forth his glory: *"}
      ];
    case "presentation":
      return [
        { 'say': "The Lord has shown forth his glory: *"}
      ];
    case "annunciation":
      return [
        { 'say': "The Word was made flesh and dwelt among us: *"}
      ];
    case "lent":
      return [
        { 'say': "The Lord is full of compassion and mercy: *"}
      ];
    case "easter":
      return [
        { 'say': "Alleluia. The Lord is risen indeed: *"
          , 'alleluia': true
        }
      ];
    case "ascension":
      return [
        { 'say': "Alleluia. Christ the Lord has ascended into heaven: *"
          , 'alleluia': true
        }
      ];
    case "pentecost":
      return [
        {
          'say': "Alleluia. The Spirit of the Lord renews the face of the earth: *"
          ,
          'alleluia': true
        }
      ];
    case "trinity":
      return [
        { 'say': "Father, Son, and Holy Spirit, one God: *"}
      ];
    case "all_saints":
      return [
        { 'say': "The Lord is glorious in his saints: *"}
      ];
  // proper and all the rest
    default:
      return [
        { 'say': "The earth is the Lord’s for he made it: *"
          , 'orThis': true
        }
        , { 'say': "Worship the Lord in the beauty of holiness: *"
          , 'orThis': true
        }
        , { 'say': "The mercy of the Lord is everlasting: *"
        }
      ];
  } // end of switch
}
