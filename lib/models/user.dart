import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  static User get empty => User(
    uid: '',
    email: null,
    displayName: null,
    photoURL: null,
  );

  User({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
  });

  factory User.fromFirebaseUser(FirebaseAuth.User firebaseUser) {
    return User(
      uid: firebaseUser.uid,
      email: firebaseUser.email,
      displayName: firebaseUser.displayName,
      photoURL: firebaseUser.photoURL,
    );
  }
}