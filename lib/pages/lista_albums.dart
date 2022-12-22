import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import '../widgets/widgets.dart';

class ListViewPageAlbums extends StatefulWidget {
  const ListViewPageAlbums({super.key});

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

  @override
  State<ListViewPageAlbums> createState() => _CustomListViewPageState();
}

class _CustomListViewPageState extends State<ListViewPageAlbums> {
  double _opacityLevel = 0;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.addListener(() {
        //print(
        //'pixel ${_scrollController.position.pixels} maxScrollExtent: ${_scrollController.position.maxScrollExtent}');
      });

      _opacityLevel = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Canciones del album'),
        ),
        drawer: const DrawerMenu(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              opacity: _opacityLevel,
              duration: const Duration(milliseconds: 500),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                // ignore: prefer_const_literals_to_create_immutables
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(ListViewPageAlbums.listaDeTracks[index]['title']
                        .toString()),
                    leading: Icon(Icons.audiotrack),
                    trailing: Icon(Icons.arrow_forward_rounded),
                    subtitle: Text(ListViewPageAlbums.listaDeTracks[index]
                            ['compositores']
                        .toString()),
                    onTap: () {
                      ListViewPageAlbums.seleccionado = index;
                      Navigator.pushReplacementNamed(context, 'cardTrack');
                    },
                  );
                },
                itemCount: ListViewPageAlbums.listaDeTracks.length,
                separatorBuilder: (_, __) {
                  return const Divider(height: 5);
                },
              ),
            )));
  }
}
