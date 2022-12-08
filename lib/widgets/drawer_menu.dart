import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.double_arrow_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Lista de canciones'),
            leading: const Icon(Icons.double_arrow_outlined),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'listaRegistros');
            },
          ),
          const Divider(height: 5),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_menu_drawer2.png'),
              fit: BoxFit.fill,
              opacity: 0.9)),
      child: Container(
        alignment: Alignment.bottomRight,
        child: const Text(
          '[  Menu  ]',
          style: TextStyle(color: Colors.indigoAccent, fontSize: 19),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
