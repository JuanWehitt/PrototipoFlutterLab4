import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canciones del album'),
      ),
      drawer: const DrawerMenu(),
      body: ListView(physics: const BouncingScrollPhysics(),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const ListTile(
              title: Text('Music of the Spheres I'),
              leading: Icon(Icons.audiotrack),
              trailing: Icon(Icons.arrow_forward_rounded),
              subtitle: Text(
                  'Coldplay - Max Martin - Rik Simpson-- Daniel Green - Federico Vindver - Bill Rahko'),
            ),
            const ListTile(
              title: Text('Higher Power'),
              leading: Icon(Icons.audiotrack),
              trailing: Icon(Icons.arrow_forward_rounded),
              subtitle: Text(
                  'Coldplay - M. Martin - Federico Vindver - Denise Carite'),
            ),
          ]),
    );
  }
}
