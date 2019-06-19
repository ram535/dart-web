import 'dart:io';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response.headers.contentType = ContentType.html;
    if (request.uri.path == "/") {
      request.response.write('<h1>Hello, world!</h1>');
    } else if (request.uri.path == "/contact") {
      request.response.write('To get in touch, please send a email to <a href=\"mailto:support@foo.com\">suppurt@foo.com</a>');
    } else {
      request.response.statusCode = HttpStatus.notFound;
      request.response.write('<h1>Could not find page</h1>');
    }
    request.response.close();
  }
}
