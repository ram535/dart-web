import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;

void main() {
  var router = Router();

  router.get('/', (Request request) {
    return Response.ok('<h1>home</h1>', headers: {'content-type': 'text/html'});
  });

  router.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });

  router.get('/user/<user>', (Request request, String user) {
    return Response.ok('hello $user');
  });

  io.serve(router.handler, 'localhost', 8080);
}
