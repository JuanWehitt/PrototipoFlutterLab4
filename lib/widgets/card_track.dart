import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/preview_provider.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/track.dart';
import '../pages/album_page.dart';
import 'package:just_audio/just_audio.dart';

class CardTrack extends StatefulWidget {
  const CardTrack({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CardTrack> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controlPreview = Provider.of<PreviewProvider>(context);
    final tracksProvider = Provider.of<TracksProvider>(context);
    //final albumProvider = Provider.of<AlbumsProvider>(context);
    final url = tracksProvider.tracks[tracksProvider.pointer].previewUrl;
    //await player.setUrl(url);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          elevation: 10,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: Icon(Icons.music_note_sharp),
                title: Text(
                  tracksProvider.tracks[tracksProvider.pointer].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'FuzzyBubbles'),
                ),
                subtitle: const Text(
                  "Titulo",
                  style: TextStyle(fontSize: 14, fontFamily: 'FuzzyBubbles'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              ListTile(
                leading: Icon(Icons.people_rounded),
                title: Text(
                  compositores(
                      tracksProvider.tracks[tracksProvider.pointer].artists),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'FuzzyBubbles'),
                ),
                subtitle: const Text(
                  "Compositores",
                  style: TextStyle(fontSize: 14, fontFamily: 'FuzzyBubbles'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              ListTile(
                leading: Icon(Icons.numbers),
                title: Text(
                  tracksProvider.tracks[tracksProvider.pointer].trackNumber
                      .toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'FuzzyBubbles'),
                ),
                subtitle: const Text(
                  "Nro de Track",
                  style: TextStyle(fontSize: 14, fontFamily: 'FuzzyBubbles'),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              ListTile(
                leading: Icon(Icons.watch_later_outlined),
                title: Text(
                  duration_track(tracksProvider
                      .tracks[tracksProvider.pointer].duration_ms),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'FuzzyBubbles'),
                ),
                subtitle: const Text(
                  "Duración",
                  style: TextStyle(fontSize: 14, fontFamily: 'FuzzyBubbles'),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Text(
                      tracksProvider.tracks[tracksProvider.pointer].explicit
                          ? "Contiene contenido explicito"
                          : "No contiene contenido explicito")),
              Container(
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Track track =
                                tracksProvider.tracks[tracksProvider.pointer];
                            Uri url = Uri(
                              scheme: 'https',
                              host: 'open.spotify.com',
                              path: '/track/' +
                                  track.externalUrls.spotify.substring(
                                      31, track.externalUrls.spotify.length),
                            );
                            launchUrl(url);
                            //print(url);
                          },
                          child: Column(
                            children: [
                              Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/spotify_logo_sn.png"),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle),
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Icon(
                                      Icons.play_circle_outline_outlined,
                                      size: 50.0,
                                    )
                                  ]),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text("Abrir Spotify"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final url = tracksProvider
                                  .tracks[tracksProvider.pointer].previewUrl;
                              await player.setUrl(url);
                              player.playing ? player.pause() : player.play();
                              player.playing
                                  ? controlPreview.play()
                                  : controlPreview.pause();
                            },
                            icon: controlPreview.playing
                                ? const Icon(
                                    Icons.pause_circle_outline_outlined)
                                : const Icon(
                                    Icons.play_circle_outline_outlined),
                            iconSize: 50,
                          ),
                          Text("Play Preview")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  child: Image.asset(
                    "images/sound.gif",
                    width: 40,
                    height: 40,
                    scale: controlPreview.playing ? 0.2 : 0.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String duration_track(int dur) {
  double dur_m_d = (dur / 1000) / 60;
  String dur_m = "";
  dur_m_d.toInt() < 10
      ? dur_m = "0${dur_m_d.toInt()}"
      : dur_m = dur_m_d.toInt().toString();
  String dur_m_s = dur_m_d.toStringAsFixed(2);
  String dur_s = dur_m_s.substring(dur_m_s.indexOf(".") + 1, dur_m_s.length);
  return '$dur_m:$dur_s';
}
