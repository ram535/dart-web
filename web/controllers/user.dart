import '../views/view.dart';
import 'package:shelf/shelf.dart' show Response, Request;
import 'dart:convert';

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
    var queryParams = Uri(query: postData).queryParameters;
    print(queryParams["email"]);
    print(queryParams["password"]);
    return Response.ok('$queryParams');
  }
}
