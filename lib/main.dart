import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prototipo_flutter_lab4/pages/track_page.dart';
import 'package:prototipo_flutter_lab4/pages/pages.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ArtistProvider>(
          create: (context) => ArtistProvider()),
      ChangeNotifierProvider<AlbumsProvider>(
          create: (context) => AlbumsProvider()),
      ChangeNotifierProvider<TracksProvider>(
          create: (context) => TracksProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final String token =
      "BQBSyhAt0Hx2-LH2LUlfq2GU6hVN1d0bE7Q-4y74agnUpJaueOtbBZjw4d-wRNwxln9Cku-6dmkJMkGE_vmEqxAGJGWS1xgM4-9cL9wdCjQ53Gg3WlyuNJ0tGDBaF4i1Vyy7CtMdM1D6LQMYiNGkh3vx2hKnri6k0AGoR-9azHS31x6KtF9nXO-HxIj24oDmgO8";
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'prototipo flutter',
        debugShowCheckedModeBanner: false,
        theme: DefaultTheme.defaultTheme,
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'listaAlbums': (context) => const ListViewPageAlbums(),
          'albumPage': (context) => const ListViewPageAlbum(),
          'trackPage': (context) => CardPage(),
        });
  }
}
