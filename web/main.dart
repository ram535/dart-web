import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;
import 'package:mustache/mustache.dart' show Template;
import 'dart:io' show File;

Template homeTemplate = Template(File('views/home.mustache').readAsStringSync(),
    partialResolver: getPartial);
Template contactTemplate = Template(
    File('views/contact.mustache').readAsStringSync(),
    partialResolver: getPartial);
Template footerPartial =
    Template(File('views/layouts/footer.mustache').readAsStringSync());
Template menuPartial =
    Template(File('views/layouts/menu.mustache').readAsStringSync());

void main() async {
  var router = Router();

  router.get('/', home);
  router.get('/contact', conact);
  router.all('/<.*>', notFound);

  await io.serve(router.handler, 'localhost', 8080);
}

Template getPartial(String name) {
  if (name == 'menu') {
    return menuPartial;
  }
  if (name == 'footer') {
    return footerPartial;
  }
  return null;
}

Future<Response> home(Request request) async {
  return Response.ok(homeTemplate.renderString(null),
      headers: {'content-type': 'text/html'});
}

Future<Response> conact(Request request) async {
  return Response.ok(contactTemplate.renderString(null),
      headers: {'content-type': 'text/html'});
}

Future<Response> notFound(Request request) async {
  return Response.notFound('Page not found');
}
