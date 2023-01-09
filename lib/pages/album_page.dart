import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/model/album.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class ListViewPageAlbum extends StatefulWidget {
  const ListViewPageAlbum({super.key});

  @override
  State<ListViewPageAlbum> createState() => _CustomListViewPageState();
}

class _CustomListViewPageState extends State<ListViewPageAlbum> {
  double _opacityLevel = 0;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.addListener(() {});
      _opacityLevel = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final albumsProvider = Provider.of<AlbumsProvider>(context);
    final int index = albumsProvider.index_seleccionado;
    final Album album = albumsProvider.albums[index];

    final tracksProvider = Provider.of<TracksProvider>(context);

    if (!albumsProvider.loadData) {
      return const Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (BuildContext context) => AlbumsProvider(),
      lazy: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text("nombreAlbum()"),
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
                      title: Text(
                          "ListViewPageAlbum.listaDeTracks[index]['title'].toString()"),
                      leading: Icon(Icons.audiotrack),
                      trailing: Icon(Icons.arrow_forward_rounded),
                      subtitle: Text(
                          "ListViewPageAlbum.listaDeTracks[index]['compositores'].toString()"),
                      onTap: () {
                        //ListViewPageAlbum.seleccionado = index;
                        Navigator.pushReplacementNamed(context, 'cardTrack');
                      },
                    );
                  },
                  itemCount: 3,
                  separatorBuilder: (_, __) {
                    return const Divider(height: 5);
                  },
                ),
              ))),
    );
  }

  /*class NombreAlbum extends StatelessWidget{

    
  }*/
}
