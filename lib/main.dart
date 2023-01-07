import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prototipo_flutter_lab4/pages/track_page.dart';
import 'package:prototipo_flutter_lab4/pages/pages.dart';
import 'package:prototipo_flutter_lab4/providers/albums_provider.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String token =
      "BQDJjUwT2kK4UagqthrxoIctWVbaTKDYR7lLHWNVic4ouHy8UVyoRMM8_FjtdWGvdLjuVMrn6tCggeaUXHy8gvr9FRz1_O1PFCbX0QR1GoQtwIIoGhfIsMJAmoOzjmX7yVwqiC-sVb5UHZG08H87Rr5ZTSPhoQUqic_NtONeBsk4K5JzTjHtk7BPmPCHXP7UG3TWTSE8I1B5EWKWcwFh4w";
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
          'cardTrack': (context) => CardPage(),
        });
  }
}
