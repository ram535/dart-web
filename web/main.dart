import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;
import 'views/view.dart';
import 'controllers/user.dart';

var homeView = View(['views/home.mustache']);
var contactView = View(['views/contact.mustache']);

void main() async {
  var userC = User();
  var router = Router();

  router.get('/', home);
  router.get('/contact', contact);
  router.get('/signup', userC.newV);
  router.post('/signup', userC.create);
  router.all('/<.*>', notFound);

  print("port 8080");
  await io.serve(router.handler, 'localhost', 8080);
}

Future<Response> home(Request _) async {
  return homeView.render();
}

Future<Response> contact(Request _) async {
  return contactView.render();
}

Future<Response> notFound(Request request) async {
  return Response.notFound('Page not found');
}
