import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/track.dart';
import '../pages/album_page.dart';

class CardTrack extends StatelessWidget {
  final int nro;

  const CardTrack({required this.nro, super.key});

  @override
  Widget build(BuildContext context) {
    final tracksProvider = Provider.of<TracksProvider>(context);
    final albumProvider = Provider.of<AlbumsProvider>(context);

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
                leading: Icon(Icons.numbers),
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
                            //https://open.spotify.com/track/2HQAeoYBn8H72Jo6UyKt6G
                            //print(tracksProvider.tracks[tracksProvider.pointer].externalUrls.spotify);
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
                            onPressed: () {
                              //"https://p.scdn.co/mp3-preview/297bfe9fea9c2585f2e85c17e8ff22c72e4b2a27?cid=774b29d4f13844c495f206cafdad9c86"
                              //print(tracksProvider.tracks[tracksProvider.pointer].previewUrl);
                              Track track =
                                  tracksProvider.tracks[tracksProvider.pointer];
                              Uri url = Uri(
                                  scheme: 'https',
                                  host: 'p.scdn.co',
                                  path: track.previewUrl.substring(
                                      18, track.previewUrl.indexOf('?')),
                                  queryParameters: {
                                    'cid': track.previewUrl.substring(
                                        track.previewUrl.indexOf('=') + 1,
                                        track.previewUrl.length)
                                  });
                              launchUrl(url);
                              //print(url);
                            },
                            icon:
                                const Icon(Icons.play_circle_outline_outlined),
                            iconSize: 50,
                          ),
                          Text("Play Preview")
                        ],
                      ),
                    ),
                  ],
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
  return dur.toString();
}
