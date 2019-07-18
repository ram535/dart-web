import 'package:shelf/shelf.dart' show Response, Request;
import '../views/view.dart';

class Static {
  var homeV = View(['static/home']);

  var contactV = View(['static/contact']);

  Future<Response> home(Request request) async {
    return homeV.render();
  }

  Future<Response> contact(Request request) async {
    return contactV.render();
  }
}
