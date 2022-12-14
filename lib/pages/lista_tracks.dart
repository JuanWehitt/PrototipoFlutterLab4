import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ListViewPage extends StatelessWidget {
  //static final List<String> listaDeTraks = List.empty(growable: false);
  static int seleccionado = 1;
  static final List<Map<String, String>> listaDeTracks = <Map<String, String>>[
    {
      'nro': '1',
      'title': 'Music of the Spheres I',
      'compositores':
          'Coldplay - Max Martin - Rik Simpson-- Daniel Green - Federico Vindver - Bill Rahko'
    },
    {
      'nro': '2',
      'title': 'Higher Power',
      'compositores': 'Coldplay - M. Martin - Federico Vindver - Denise Carite'
    }
  ];
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Canciones del album'),
        ),
        drawer: const DrawerMenu(),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          // ignore: prefer_const_literals_to_create_immutables
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title:
                  Text(ListViewPage.listaDeTracks[index]['title'].toString()),
              leading: Icon(Icons.audiotrack),
              trailing: Icon(Icons.arrow_forward_rounded),
              subtitle: Text(
                  ListViewPage.listaDeTracks[index]['compositores'].toString()),
              onTap: () {
                seleccionado = index;
                Navigator.pushReplacementNamed(context, 'cardTrack');
              },
            );
          },
          itemCount: ListViewPage.listaDeTracks.length,
          separatorBuilder: (_, __) {
            return const Divider(height: 5);
          },
          /*children: [
            ListTile(
              title: Text('Music of the Spheres I'),
              leading: Icon(Icons.audiotrack),
              trailing: Icon(Icons.arrow_forward_rounded),
              subtitle: const Text(
                  'Coldplay - Max Martin - Rik Simpson-- Daniel Green - Federico Vindver - Bill Rahko'),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'cardTrack');
              },
            ),
            const ListTile(
              title: Text('Higher Power'),
              leading: Icon(Icons.audiotrack),
              trailing: Icon(Icons.arrow_forward_rounded),
              subtitle: Text(
                  'Coldplay - M. Martin - Federico Vindver - Denise Carite'),
            ),
          ]),*/
        ));
  }
}
