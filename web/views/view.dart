import 'package:mustache/mustache.dart' show Template;
import 'dart:io' show File;

class View {
  var template;

  final layoutDir = 'views/layouts/';
  final templateExt = '.mustache';

  View(List<String> filePaths) {
    newView(filePaths);
  }

  void newView(List<String> filePaths) {
    String content = "";
    // concatenate the content of each file into the content variable
    for (var filePath in filePaths) {
      content += (File(filePath).readAsStringSync());
    }
    template = Template(content, partialResolver: getPartial);
  }

  Template getPartial(String name) {
    switch (name) {
      case 'header':
        return getTemplate(name);
      case 'footer':
        return getTemplate(name);
      default:
        return null;
    }
  }

  Template getTemplate(String name) {
    var content = File(layoutDir + name + templateExt).readAsStringSync();
    return Template(content);
  }
}
