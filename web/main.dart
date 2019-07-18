import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;
import 'controllers/user.dart';
import 'controllers/static.dart';

void main() async {
  var staticC = Static();
  var userC = User();
  var router = Router();

  router.get('/', staticC.home);
  router.get('/contact', staticC.contact);
  router.get('/signup', userC.newV);
  router.post('/signup', userC.create);
  router.all('/<.*>', notFound);

  print("port 8080");
  await io.serve(router.handler, 'localhost', 8080);
}

Future<Response> notFound(Request request) async {
  return Response.notFound('Page not found');
}
