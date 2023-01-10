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
      "BQA4tbJNd9v40qePZuaoahRf6HcOPRoct5WgQShkzx84kiKNrWxkQB_8Mmyn_C6lVkrjOuWxVFph0QQjhtr77N5_sr1Y4ep99zG2g39Givfs2j5ORI6HLnIMHglxH5ecSuqGml-_m8GUgaQFm2SUfDmbMSnzkbnHT37uvZ1EQqTuERULOGRuoLLqNyRZ4WrG_Yb9fwmPdSfgSPbcrxBkQA";
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
          'cardTrack': (context) => CardPage(),
        });
  }
}
