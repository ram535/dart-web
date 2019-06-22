import 'package:mustache/mustache.dart';
import 'dart:io';

void main() async {
  var data = {'name': 'bar'};
  var template = Template(File('hello.mustache').readAsStringSync());

  var output = template.renderString(data);
  print(output);
}
