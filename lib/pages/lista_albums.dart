import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/albums_provider.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class ListViewPageAlbums extends StatelessWidget {
  const ListViewPageAlbums({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context) => AlbumsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Albums'),
        ),
        drawer: DrawerMenu(),
        body: const Center(
          child: ListaAlbum(),
        ),
      ),
    );
  }
}

class ListaAlbum extends StatelessWidget {
  const ListaAlbum({
    Key? key,
  }) : super(key: key);

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

    return ListView.separated(
      itemCount: listaAlbum.albums.length,
      separatorBuilder: (context, index) => const Divider(
        height: 5,
      ),
      itemBuilder: (context, index) {
        //listaAlbum.photos[index].urls.small
        return ListTile(
          title: Text(listaAlbum.albums[index].name,
              style: const TextStyle(color: Colors.black)),
          subtitle: Text(listaAlbum.albums[index].artists.toString()),
          leading: Image(
              image: NetworkImage(listaAlbum.albums[index].images[0].url)),
          trailing: Icon(Icons.arrow_forward_rounded),
        );
      },
    );
  }
}
