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
      "BQB150BcWGmxGsw310_I3Uja2X6b-xuOG3bFh1zbHBhgvi7UlNIFavPCsxE11RZ2oXqIAz932-aoLIzFIlZaqhfti-hPeEZls6IWOYzQ833oOpBaBGadxCh3u0LUhyGJnnIwxhlsnWrkFvNK0WydrpjzwJYR_yTl8GCTp8wGDFrK2yyaP5uLTyEaWzeIlOxHraFihv_SMjLzkd6izTbkdQ";
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
