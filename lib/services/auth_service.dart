import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try{
    var user = await auth.signInWithEmailAndPassword(
      email: 'mayra_carvalho@estudante.sesisenai.org.br', 
      password: 'Mayra1234');
      return user;
    }catch (e) {
      rethrow;
    }
  }

    recoverPassword() async {
    try{
    return await auth.sendPasswordResetEmail(
      email: 'mayra_carvalho@estudante.sesisenai.org.br');
    }catch (e) {
      rethrow;
    }
  }

  checkUser() async {
    var user = auth.currentUser!.displayName;
    return user;
  }
}


