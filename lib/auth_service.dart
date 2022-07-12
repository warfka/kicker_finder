import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kicker_finder/pages/homePage.dart';
import 'package:kicker_finder/pages/playerProfilePage.dart';
import 'package:kicker_finder/pages/settingsPage.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return PlayerProfilePage(title: 'Player profile page');
        } else {
          return SettingsPage(title: 'Settings page');
        }
      },
    );
  }

  signInGoogleAccount() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
