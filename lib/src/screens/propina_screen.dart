import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica2/src/utils/color_settings.dart';

class PropinasScreen extends StatefulWidget {
  PropinasScreen({Key? key}) : super(key: key);

  @override
  _PropinasScreen createState() => _PropinasScreen();
}

class _PropinasScreen extends State<PropinasScreen> {
  final validador = GlobalKey<FormState>();
  TextEditingController contenedor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Form inputForm = Form(
        key: validador,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Monto de la cuenta";
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'^([0-9]+)?(?:\.[0-9]*)?$'))
              ],
              controller: contenedor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                hintText: 'Ingrese el monto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Column(
              children: [
                Divider(
                  height: 10,
                ),
              ],
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: ColorSetting.colorButton),
              onPressed: () {
                if (validador.currentState!.validate()) {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              title: Text('Monto a pagar'),
                              content: Text(
                                  'Cuenta total: ${(double.parse(contenedor.text) * 1.10).toStringAsFixed(3)} (incluye propina 10%)'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Pagado"))
                              ]));
                }
              },
              child: Text("Calcular total + propina "),
            )
          ],
        ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Propinas'),
          backgroundColor: ColorSetting.colorPrimary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text("Ingrese el monto de la cuenta a pagar: "),
                SizedBox(height: 15),
                inputForm,
              ],
            ),
          ),
        ));
  }
}
