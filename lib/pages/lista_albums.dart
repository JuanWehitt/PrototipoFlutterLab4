import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/albums_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ListViewPageAlbums extends StatelessWidget {
  const ListViewPageAlbums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      drawer: DrawerMenu(),
      body: ListaAlbum(),
    );
  }
}

class ListaAlbum extends StatefulWidget {
  const ListaAlbum({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaAlbum> createState() => _CustomListaAlbum();
}

class _CustomListaAlbum extends State<ListaAlbum> {
  double _opacityLevel = 0;
  //double _height = 100.0;
  //int _index = 1;
  //ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      _opacityLevel = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final listaAlbum = Provider.of<AlbumsProvider>(context);

    if (!listaAlbum.loadData) {
      return const Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (listaAlbum.next()) {
      listaAlbum.loadData = false;
      listaAlbum.siguientePagina();
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _opacityLevel,
      child: ListView.separated(
        itemCount: listaAlbum.albums.length,
        separatorBuilder: (context, index) => const Divider(
          height: 5,
        ),
        itemBuilder: (context, index) {
          //listaAlbum.photos[index].urls.small
          listaAlbum.pointer = index;
          return ListTile(
            title: Text(listaAlbum.albums[index].name,
                style: const TextStyle(color: Colors.black, fontSize: 18)),
            subtitle: Text(
                '${artistas_de(index, listaAlbum)}${anio_de_album(index, listaAlbum)} - ${listaAlbum.albums[index].totalTracks} tracks'),
            leading: Image(
                image: NetworkImage(listaAlbum.albums[index].images[0].url,
                    scale: 0.9)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_forward_rounded),
              ],
            ),
            onTap: () {
              listaAlbum.pointer = index;
              Navigator.pushReplacementNamed(context, 'albumPage');
            },
            visualDensity: const VisualDensity(vertical: 3.9),
            isThreeLine: true,
          );
        },
      ),
    );
  }

  String artistas_de(int index, AlbumsProvider listaAlbum) {
    String cadena = "";
    listaAlbum.albums[index].artists.forEach((element) {
      cadena += " - ${element.name}";
    });
    return "$cadena - ";
  }

  String anio_de_album(int index, AlbumsProvider listaAlbum) {
    return listaAlbum.albums[index].releaseDate.year.toString();
  }
}
