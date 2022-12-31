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
            title: const Text('Coldplay - Music of the Spheres'),
            centerTitle: true,
            elevation: 10.0,
          ),
          drawer: const DrawerMenu(),
          // ignore: prefer_const_constructors
          body: Center(
            child: const FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image:
                  AssetImage('assets/images/coldplay_music_of_the_spheres.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 564,
              // ancho y alto del dispositivo : 420 x 620
            ),
          )),
    );
  }
}
