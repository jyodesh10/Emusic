import 'package:emusic/app/constants/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

AuthController authController = AuthController.authInstance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
