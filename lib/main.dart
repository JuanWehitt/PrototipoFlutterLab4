import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prototipo_flutter_lab4/Shared_data/data.dart';
import 'package:prototipo_flutter_lab4/pages/pages.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Notes.init();
  await FavoritesData.init();

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
      "BQBzCHrWQqO--TEs4V93nKHXloSCcR4321qvtWox54T4Fu0iX007OP08ipAZSfxckEkojmF3vfUiNnJMnSYy1IQ14Lawh8HgT9ZWroPXkszLFOhn7QNJVrTGWdHL8hN9eN3fm13k2LQBtDrezvdnfF826a7gCwQTGpgt3vj--_yhgTSZc2mWce0CYQDwnVgZN0i4vXr9e_JsAy-yyBFbLhA";
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
          'listaFavoritas': (context) => const ListViewPageFavorites(),
        });
  }
}
