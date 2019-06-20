import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart' show Response, Request;
import 'package:shelf/shelf_io.dart' as io;

void main() async{
  var router = Router();

  router.get('/', home);
  router.get('/hello', hello);
  router.get('/user/<user>', user);
  router.all('/<.*>', notFound);

  await io.serve(router.handler, 'localhost', 8080);
}

Future<Response> home(Request request) async{
    return Response.ok('<h1>home</h1>', headers: {'content-type': 'text/html'});
}

Future<Response> hello(Request request) async{
    return Response.ok('hello-world');
}

Future<Response> user(Request request, String user) async{
    return Response.ok('hello $user');
}

Future<Response> notFound(Request request) async{
    return Response.notFound('foo');
}
