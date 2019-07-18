import 'package:shelf/shelf.dart' show Request;

Future<SignupForm> pastForm(Request request) async {
  var postData = await request.readAsString();
  var queryParams = Uri.splitQueryString(postData);

  var form = SignupForm.fromJson(queryParams);
  return form;
}

class SignupForm {
  var email;
  var password;

  SignupForm.fromJson(Map json) {
    this.email = json['email'];
    this.password = json['password'];
  }
}
