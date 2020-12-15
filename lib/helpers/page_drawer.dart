import 'package:flutter/material.dart';

class Nav {
  String label;
  String route;

  Nav({this.label, this.route});
}


class PageDrawer extends StatelessWidget {
  List<Nav> pages = [
    Nav( label: 'Calendar', route:  '/calendar' ),
    Nav( label: 'Morning Prayer', route:  '/mp' ),
    Nav( label: 'Midday Prayer', route:  '/midday' ),
    Nav( label: 'Evening Prayer', route:  '/ep' ),
    Nav( label: 'Compline', route:  '/compline' ),
    Nav( label: 'Family Prayers', route:  '/fp' ),
    Nav( label: 'Reconciliation', route:  '/reconciliation' ),
    Nav( label: 'To the Sick', route:  '/sick' ),
    Nav( label: 'Communion to the Sick', route:  '/comm' ),
    Nav( label: 'Time of Death', route:  '/tod' ),
    Nav( label: 'Prayers for a Vigil', route:  '/vigil' ),
    //Nav( label: 'Prayer List', route:  '/pl' ),
    Nav( label: 'Occasional Prayers', route:  '/ops' ),
    Nav( label: 'Canticles', route:  '/cants' ),
    Nav( label: 'About', route:  '/about' ),
    //Nav( label: 'Blog', route:  '/blog' ),
    //Nav( label: 'Contact', route: '/contact'),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: pages.map( (p) =>
                ListTile(
                    title: Text('${p.label}'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, p.route);
                    }
                )
            ).toList()
        )
    );

  }
}
