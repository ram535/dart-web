import 'package:shelf/shelf.dart' show Request;
import 'schema/signup_form_schema_generated.dart' as schema;

Future<dynamic> pastForm(Request request) async {
  var postData = await request.readAsString();
  var queryParams = Uri.splitQueryString(postData);

  var dstBuilder = schema.SignupFormObjectBuilder(
      email: queryParams["email"],
      password: queryParams["password"],
      id: int.parse('22'));
  var buffer = dstBuilder.toBytes();
  return schema.SignupForm(buffer);
}
