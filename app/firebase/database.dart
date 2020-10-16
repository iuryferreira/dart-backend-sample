import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firedart.dart';
import 'package:dotenv/dotenv.dart';

class Database {
  FirebaseAuth auth;
  Firestore context;

  Database() {
    FirebaseAuth.initialize(env['API_KEY'], VolatileStore());
    Firestore.initialize(env['PROJECT_ID']);
    this.auth = FirebaseAuth.instance;
    this.context = Firestore.instance;
  }

  signIn() async {
    await this.auth.signIn(env['EMAIL'], env['PASSWORD']);
  }
}

final db = Database();
