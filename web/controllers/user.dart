import '../views/view.dart';
import 'package:shelf/shelf.dart' show Response, Request;

class User {
  var _newView;

  User() {
    _newView = View(['views/users/new.mustache']);
  }

  Future<Response> newV(Request _) async {
    return _newView.render();
  }

  Future<Response> create(Request _) async {
    return Response.ok('Temporary response');
  }
}
