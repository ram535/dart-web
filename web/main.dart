import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;
import 'views/view.dart';

var homeView = View(['views/home.mustache']);
var contactView = View(['views/contact.mustache']);

void main() async {
  var router = Router();

  router.get('/', home);
  router.get('/contact', conact);
  router.all('/<.*>', notFound);

  await io.serve(router.handler, 'localhost', 8080);
}

Future<Response> home(Request request) async {
  return Response.ok(homeView.template.renderString(null),
      headers: {'content-type': 'text/html'});
}

Future<Response> conact(Request request) async {
  return Response.ok(contactView.template.renderString(null),
      headers: {'content-type': 'text/html'});
}

Future<Response> notFound(Request request) async {
  return Response.notFound('Page not found');
}
