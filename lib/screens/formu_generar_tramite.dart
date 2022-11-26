import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/services/notification_services.dart';
import 'package:proyecto1/widgets/index.dart';

class FormularioGenerarTramiteScreen extends StatefulWidget {
  const FormularioGenerarTramiteScreen({Key? key}) : super(key: key);

  @override
  State<FormularioGenerarTramiteScreen> createState() =>
      _FormularioGenerarTramiteScreenState();
}

class _FormularioGenerarTramiteScreenState
    extends State<FormularioGenerarTramiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Preferences.titulo,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFieldScreen(
              initialValue: '',
              keyboardType: TextInputType.text,
              hintext: 'Facultad',
              prefixIcon: Icon(Icons.school_outlined),
              onChange: (value) {
                setState(() {});
              },
            ),
            CustomTextFieldScreen(
              initialValue: '',
              keyboardType: TextInputType.number,
              hintext: 'Codigo de Recibo',
              prefixIcon: Icon(Icons.receipt_long_outlined),
              onChange: (value) {
                setState(() {});
              },
            ),
            CustomTextFieldScreen(
              initialValue: '',
              keyboardType: TextInputType.text,
              hintext: 'Sede',
              prefixIcon: Icon(Icons.home_work_outlined),
              onChange: (value) {
                setState(() {});
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Enviar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                //Cerrar el teclado
                FocusScope.of(context).requestFocus(new FocusNode());
                Future.delayed(const Duration(milliseconds: 500), () {
                  NotificationServices.showSnackbar('Trámite enviado');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
