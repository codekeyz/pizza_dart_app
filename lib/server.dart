import 'dart:io';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  int port = int.tryParse(Platform.environment['PORT'] ?? '') ?? 8080;

  var app = Router();

  app.get('/', (req) => Response.ok("Have some pizza 🍕"));

  await io.serve(app.call, 'localhost', port);

  print('Server started -> localhost:$port');
}
