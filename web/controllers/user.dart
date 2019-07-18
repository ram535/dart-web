import '../views/view.dart';
import 'package:shelf/shelf.dart' show Response, Request;
import 'helpers.dart' show pastForm;

class User {
  var _newView;

  User() {
    _newView = View(['users/new']);
  }

  Future<Response> newV(Request _) async {
    return _newView.render();
  }

  Future<Response> create(Request request) async {
    var signupForm = await pastForm(request);

    return Response.ok(signupForm.email);
  }
}
