import 'package:flutter/material.dart';
import 'package:flutter_application_5/services/auth_service.dart';

class CustomButton extends StatelessWidget {
  
  String titleButton;

  CustomButton({super.key, required this.titleButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try{
            await FirebaseAuthService().login();
            Navigator.pushReplacementNamed(context, '/');
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Usuário ou senha incorretos'),
              )
            );
          }
        }, 
        child: Text(titleButton)),
    );
  }
}
