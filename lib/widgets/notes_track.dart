import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:provider/provider.dart';

import '../Shared_data/data.dart';

class NotesTrack extends StatelessWidget {
  const NotesTrack({super.key});

  @override
  Widget build(BuildContext context) {
    final trackProvider = Provider.of<TracksProvider>(context);
    final track = trackProvider.tracks[trackProvider.pointer];
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Mis notas",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'PaytoneOne',
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 5, 0, 71),
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: Notes.getNote(track.id),
                  minLines: 14,
                  maxLines: 20,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  onChanged: ((value) {
                    value == ""
                        ? Notes.quitNote(track.id)
                        : Notes.addNote(track.id, value);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
