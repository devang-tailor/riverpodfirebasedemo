import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodfirebasedemo/services/firebase_auth_service.dart';
import 'package:riverpodfirebasedemo/services/firestore_service.dart';

final firebaseAuthServiceProvider = Provider((_) => FirebaseAuthService());
final firestoreServiceProvider = Provider((_) => FirestoreService());
