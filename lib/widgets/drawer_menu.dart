import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/artist_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.double_arrow_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Albums'),
            leading: const Icon(Icons.double_arrow_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'listaAlbums');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Favoritas'),
            leading: const Icon(Icons.double_arrow_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'listaFavoritas');
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artist = Provider.of<ArtistProvider>(context);
    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(artist.artista.images[1]
                  .url), //AssetImage('assets/images/coldplay-1-2-logo.gif'),
              fit: BoxFit.cover,
              opacity: 0.9)),
      child: Container(
        alignment: Alignment.bottomRight,
        child: const Text(
          'Coldplay Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.black,
                offset: Offset(3.0, 3.0),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
