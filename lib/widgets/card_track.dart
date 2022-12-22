import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/model/album.dart';
import 'package:prototipo_flutter_lab4/pages/lista_tracks.dart';

class CardTrack extends StatelessWidget {
  final int nro;

  const CardTrack({required this.nro, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: Icon(Icons.music_note_sharp),
                title: Text(
                  ListViewPage.listaDeTracks[nro]['title'].toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'FuzzyBubbles'),
                ),
                subtitle: Text(
                  ListViewPage.listaDeTracks[nro]['compositores'].toString(),
                  style: TextStyle(fontSize: 14, fontFamily: 'FuzzyBubbles'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                minVerticalPadding: 15,
                minLeadingWidth: 30,
              ),
              // ignore: prefer_const_constructors
              FadeInImage(
                placeholder: AssetImage('assets/images/loading.gif'),
                image: AssetImage("assets/images/coldplay-1-2-logo.gif"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 450,
                fadeInDuration: const Duration(milliseconds: 600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
