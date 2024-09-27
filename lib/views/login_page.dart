import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/custom_button.dart';
import 'package:flutter_application_5/components/custom_input.dart';
import 'package:flutter_application_5/components/social_auth.dart';
import 'package:flutter_application_5/views/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 218, 218),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            CustomInput(
              labelText: "E-mail",
            ),
            CustomInput(
              labelText: "Senha",
              obscure: true,
            ),
            CustomButton(
              titleButton: "Entrar",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ainda não tem uma conta?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: Text("Cadastre-se"))
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SocialAuth(
                imgLink:
                    'https://cdn-icons-png.flaticon.com/128/3955/3955011.png',
              ),
              SocialAuth(
                imgLink:
                    'https://cdn-icons-png.flaticon.com/128/281/281764.png',
              ),
              SocialAuth(
                imgLink:
                    'https://cdn-icons-png.flaticon.com/128/270/270798.png',
              ),
            ])
          ],
        ),
      ),
    );
  }
}
