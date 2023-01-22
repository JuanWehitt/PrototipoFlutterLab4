import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prototipo_flutter_lab4/pages/track_page.dart';
import 'package:prototipo_flutter_lab4/pages/pages.dart';
import 'package:prototipo_flutter_lab4/providers/preview_provider.dart';
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
      ChangeNotifierProvider<PreviewProvider>(
          create: (context) => PreviewProvider()),
      ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider()),
      ChangeNotifierProvider<TrackPageProvider>(
          create: (context) => TrackPageProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final String token =
      "BQD8dy9qLaYCHS6lJRSLUo3IQm7SetwT5BOs90DDxyJYlUVSa0w3huva24IuTOQXhZBAC3R9dg3XFPSOOp5e5Rbsz4ntifA2Wr0MCOHMqIjOzbq8FEX7kXJmyMve7W7wdQOngJvaXzM4Y1swDhvwAc9fcXANEbTetadR8TfYohZcYmY38_4ZZkYTXvc2IwGure6eeNAKR-h1OWV_BmH9YA";
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
