import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;
import 'package:mustache/mustache.dart' show Template;
import 'dart:io' show File;

Template homeTemplate;

void main() async {
 homeTemplate = Template(File('views/home.mustache').readAsStringSync());

  var router = Router();

  router.get('/', home);
  router.all('/<.*>', notFound);

  await io.serve(router.handler, 'localhost', 8080);
}

Future<Response> home(Request request) async {
  return Response.ok(homeTemplate.renderString(null), headers: {'content-type': 'text/html'});
}

Future<Response> notFound(Request request) async {
  return Response.notFound('foo');
}
