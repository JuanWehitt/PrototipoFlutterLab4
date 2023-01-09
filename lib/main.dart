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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String token =
      "BQBL55GBv5gsbHVZTQBElc8bH_ge-JxRwmqCmHQWTU_xWzcSIJoFESVHObY6_2EF_-9K-xaQl2v-xSHCCFFN4qE8mM_LmyCu2DAyNOnbJXsqnjkBAfhpq-yWsRLSGfAdMRydnzZeq6hKI881c_Vn3T7OIDYyZVqIbKAm8TPPsmFIkSCyoxZVQJATVzHPHJG9QrEyFJCAV3nC8xugLPByyQ";
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
