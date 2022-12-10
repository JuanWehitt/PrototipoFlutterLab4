import 'package:flutter/material.dart';

class CardTrack extends StatelessWidget {
  final String nombre;
  final String autores;
  final String compositores;

  const CardTrack(
      {required this.nombre,
      required this.autores,
      required this.compositores,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.image),
              title: Text(
                nombre,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: 'FuzzyBubbles'),
              ),
              subtitle: const Text(
                'Ea consectetur ex fugiat id commodo sit sint dolore minim ut aute. Et veniam excepteur duis nisi eu sint do. Et veniam excepteur duis nisi eu sint do. Ea consectetur ex fugiat id commodo sit sint dolore minim ut aute. Et veniam excepteur duis nisi eu sint do.',
                style: TextStyle(fontSize: 14, fontFamily: 'FuzzyBubbles'),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
              minVerticalPadding: 15,
              minLeadingWidth: 30,
            ),
          ],
        ),
      ),
    );
  }
}
