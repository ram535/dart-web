import 'package:mustache/mustache.dart';
import 'dart:io';

void main() async {
  var fooMap = {'key1': 'value1', 'key2': 'value2'};
  var data = {
    'name': 'bar',
    'slice': [1, 2, 3],
    'map': fooMap
  };
  var template = Template(File('hello.mustache').readAsStringSync());

  var output = template.renderString(data);
  print(output);
}
