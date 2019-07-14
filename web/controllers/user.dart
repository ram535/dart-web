import '../views/view.dart';
import 'package:shelf/shelf.dart' show Response, Request;
import 'schema/signup_form_schema_generated.dart' as schema;

class User {
  var _newView;

  User() {
    _newView = View(['views/users/new.mustache']);
  }

  Future<Response> newV(Request _) async {
    return _newView.render();
  }

  Future<Response> create(Request request) async {
    var postData = await request.readAsString();
    // var queryParams = Uri(query: postData).queryParameters;
    var queryParams = Uri.splitQueryString(postData);

    var signupFormBuilder = schema.SignupFormObjectBuilder(
        email: queryParams["email"],
        password: queryParams["password"],
        id: int.parse('22'));
    var buffer = signupFormBuilder.toBytes();
    var signupForm = schema.SignupForm(buffer);
    print(signupForm);
    return Response.ok(signupForm.email);
  }
}
