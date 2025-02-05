import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_container/mirrors.dart';
import 'package:todart_core/core.dart';
import 'routes.dart';

class Application {
  Angel app;
  AngelHttp server;
  Application() {
    this.app = Angel(reflector: MirrorsReflector());
    setupContainer();
    this.routes();
  }

  startServer() async {
    this.server = AngelHttp(app);
    await this.server.startServer('localhost', 3000);
  }

  routes() {
    routesTodo(this.app);
    this.app.fallback((req, res) => throw AngelHttpException.notFound());
  }
}
