import 'package:dotenv/dotenv.dart';
import 'src/app.dart';

Application app;

main() async {
  load();
  app = Application();
  await app.startServer();
}
