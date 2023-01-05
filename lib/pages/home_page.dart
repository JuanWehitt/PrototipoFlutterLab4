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

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(artist.artista.images[0].url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.blueGrey.withOpacity(0.9), BlendMode.color),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    " " + artist.artista.followers.total.toString() + " ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text("seguidores en",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'PaytoneOne',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      width: 193,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.black54,
                        image: DecorationImage(
                          image: AssetImage("images/spotify_logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
