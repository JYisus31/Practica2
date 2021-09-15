import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
        backgroundColor: ColorSetting.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Text('Jesus R.J'),
            accountEmail: Text('rico.juarez.jesus.1.j@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 16.0,
              child: ClipRRect(
                child: Image.asset('pugberto.jpg'),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            decoration: BoxDecoration(
              color: ColorSetting.colorPrimary,
            ),
          ),
          ListTile(
            title: Text('Practica 1'),
            subtitle: Text('Descripcion corta'),
            leading: Icon(Icons.monetization_on_outlined),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/opc1');
            },
          ),
          ListTile(
            title: Text('Intenciones'),
            subtitle: Text('Intenciones implicitas'),
            leading: Icon(Icons.phone_android),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/intenciones');
            },
          ),
          ListTile(
            title: Text('Propinas'),
            subtitle: Text('PROPINAS'),
            leading: Icon(Icons.monetization_on_outlined),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/propina');
            },
          ),
        ]),
      ),
    );
  }
}
