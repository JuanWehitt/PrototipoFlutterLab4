import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/artist_provider.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_app/themes/default_theme.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        lazy: false,
        create: (BuildContext context) => ArtistProvider(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Coldplay'),
            centerTitle: true,
            elevation: 10.0,
          ),
          drawer: const DrawerMenu(),
          // ignore: prefer_const_constructors
          body: BodyHome(),
        ));
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artist = Provider.of<ArtistProvider>(context);

    if (!artist.loadData) {
      return const Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
    }

    /*return FadeInImage(
        placeholder: AssetImage('assets/images/loading.gif'),
        image: NetworkImage(artist.artista.images[0].url));
*/
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(artist.artista.images[0].url),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.color),
      ),
    ));
  }
}
