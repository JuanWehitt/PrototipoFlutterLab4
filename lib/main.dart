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
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final String token =
      "BQCS6WuJbMDNsBujQq4OHF0HIO3QlFvyxR0RNQZnxd8vOjSi9A4Hn8C6FcgRHywW-gTnXUsTbi1z3H5F5Wrkrt9B67280mLbdjIWl-_2XY2OYMwMeI74TcmR3EN4Mk-QXd-NTTn6siGjxNfkUrKJu5JBCsm87rctXZE0E0L_jBtccaV0rM5YLb10ufarA7QOyzTCmXiew8UQHOPTiQA2xw";
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
