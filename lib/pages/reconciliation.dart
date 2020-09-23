import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/iphod_scaffold.dart';
import 'package:flutter_phod/helpers/paragraph.dart';
import 'package:flutter_phod/helpers/rubric.dart';
import 'package:flutter_phod/helpers/versical.dart';
import 'package:flutter_phod/stores/litday.dart';
import 'package:flutter_phod/helpers/page_header.dart';

class Reconciliation extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return IphodScaffold(
        title: 'Reconciliation',
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
    child: ListView
      ( controller: _scrollController
      , padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
      , children: <Widget>
        [ PageHeader(litDay: LitDay().init())
        , Rubric("The Penitent begins")
        , Paragraph("Bless me, for I have sinned.")
        , Rubric("Priest says")
        , Paragraph( """
            The Lord be in your heart and upon your lips that you may truly and 
            humbly confess your sins: In the Name of the Father, and of the Son,
            and of the Holy Spirit. *Amen*.
            """)
        , Rubric("Penitent")
        , Paragraph( """
            I confess to Almighty God, to his Church, and to you, that I have 
            sinned by my own fault in thought, word, and deed, in things done 
            and left undone; especially __________. For these and all other sins
            that I cannot now remember, I am truly sorry. I pray God to have 
            mercy on me. I firmly intend amendment of life, and I humbly beg 
            forgiveness of God and his Church, and ask you for counsel, 
            direction, and absolution.
            """)
        , Rubric("Here the Priest may offer counsel, direction, and comfort.")
        , Rubric("The Priest then declares")
        , Paragraph( """
            Our Lord Jesus Christ, who has given power to his Church to absolve
            all sinners who truly repent and believe in him, of his great mercy
            forgive you all your offenses; and by his authority committed to me,
            I absolve you from all your sins: In the Name of the Father, and of
            the Son, and of the Holy Spirit. *Amen*.
            """)
        , Rubric("or")
        , Paragraph( """
            Almighty God, our heavenly Father, who in his great mercy has
            promised forgiveness of sins to all those who sincerely repent and
            with true faith turn to him, have mercy upon you, pardon and deliver 
            you from all your sins, confirm and strengthen you in all goodness, 
            and bring you to everlasting life; through Jesus Christ our Lord. *Amen*.
            """)
        , Versical(says: "The Lord has put away all your sins.")
        , Versical(speaker: "Penitent", says: "Thanks be to God.")
        , Rubric("The following prayer may also be said")
        , Paragraph("Let us pray.")
        , Paragraph( """
            O most loving Father, by your mercy you put away the sins of those
            who truly repent, and remember their sins no more. Restore and renew
            in your servant whatever has been corrupted by the fraud and malice
            of the devil, or by his own selfish will and weakness. Preserve and
            protect him within the fellowship of the Church; hear his prayers 
            and relieve his pain; through Jesus Christ our Lord. *Amen*.
            """)
        , Rubric("The Priest concludes")
        , Paragraph("Go (or abide) in peace, and pray for me, a sinner.")
        ],
      ),
      )
    );

  }
}
// TODO Implement this library.