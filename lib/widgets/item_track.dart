import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class ItemTrack extends StatelessWidget {
  int index = 0;
  ItemTrack({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final tracksProvider = Provider.of<TracksProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          tracksProvider.pointer = index;
          //tracksProvider.idTrackSeleccionado = idTrack;
          Navigator.pushReplacementNamed(context, 'trackPage');
        },
        child: Container(
          height: 55.0,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 156, 164, 175),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0, 6))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.music_note,
                  size: 40, color: DefaultTheme.primary),
              Expanded(
                child: Text(
                  tracksProvider.tracks[index].name,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.arrow_forward_sharp)),
            ],
          ),
        ),
      ),
    );
  }
}
