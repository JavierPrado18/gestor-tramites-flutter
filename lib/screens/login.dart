import 'package:flutter/material.dart';
import 'package:proyecto1/screens/index.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputFiel(context),
              _olvidePass(context),
              _inscribirse(context),
            ]
          ),
        ), 
      ),
    );
  }
  _header(context){
    return Column(      
      children: const [
        Text('BIENVENIDO', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
        Text('Registrese para Ingresar')
      ],
    );
  }
  _inputFiel(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'INGRESE USUARIO',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person),            
           ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: 'INGRESE CONTRASEÑA',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person),            
           ),
           obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (contex)=> const HomeScreem())),            
          }, 
          child: Text(
            'INGRESAR',
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
  _olvidePass(context){
    return TextButton(
      onPressed: () => {},
      child: Text('Olvidaste Contraseña'),
    );
  }
   _inscribirse(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No Tengo Cuenta??'),
        TextButton(onPressed: (){},
        child: Text('Inscribirse'))
      ],     
    );
  }

}