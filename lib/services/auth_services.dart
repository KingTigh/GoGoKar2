import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign in
  signInWithGoogle() async {
    // begin interactive sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obtain auth deatails from request
    GoogleSignInAuthentication? gAuth = await gUser!.authentication;
    // create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // fially sign in the user
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
