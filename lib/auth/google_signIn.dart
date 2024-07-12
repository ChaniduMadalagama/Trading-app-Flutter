import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prayas_capital/Controller/app_theme/ThemeModel.dart';

// Future<OAuthCredential?> signInWithGoogle() async {
//   try {
//     await InternetAddress.lookup('google.com');
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//     await googleUser?.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     return credential;
//   } catch (e) {
//     log('\n_signInWithGoogle: $e');
//     return null;
//   }
// }

class Authentication {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User? user;
  static Future<User?> signInWithGoogle(
      ThemeModel loginProvider, BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      //try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      user = userCredential.user;
      loginProvider.loginUser(
          userEmail: user!.email.toString(),
          name: user!.displayName,
          id: "",
          token: googleSignInAuthentication.accessToken,
          context: context);

      /* } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }*/
    }
    return user;
  }
}
