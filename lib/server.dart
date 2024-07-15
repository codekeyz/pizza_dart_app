import 'dart:io';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  int port = int.tryParse(Platform.environment['PORT'] ?? '') ?? 8080;

  final app = Router();

  app.get(
    '/',
    (req) => Response.ok(
      "Heya 🍕",
      headers: {HttpHeaders.contentTypeHeader: 'text/plain; charset=utf-8'},
    ),
  );

  await io.serve(app.call, InternetAddress.anyIPv4, port);

  print('Server started -> localhost:$port');
}
